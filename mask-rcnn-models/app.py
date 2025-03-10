from flask import Flask, request, jsonify
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
from detectron2 import model_zoo
from detectron2.utils.visualizer import Visualizer
from detectron2.data import MetadataCatalog
from detectron2.structures import Boxes, pairwise_iou
import torch
import cv2
import numpy as np
from flask_cors import CORS
import base64

app = Flask(__name__)
CORS(app, resources={r"/detect_damage": {"origins": "*"}})  # CORS ayarları

# Sınıf haritaları
part_category_mapping = {
    "Quarter-panel": 0, "Front-wheel": 1, "Back-window": 2, "Trunk": 3, "Front-door": 4,
    "Rocker-panel": 5, "Grille": 6, "Windshield": 7, "Front-window": 8, "Back-door": 9,
    "Headlight": 10, "Back-wheel": 11, "Back-windshield": 12, "Hood": 13, "Fender": 14,
    "Tail-light": 15, "License-plate": 16, "Front-bumper": 17, "Back-bumper": 18, "Mirror": 19, "Roof": 20
}

damage_category_mapping = {
    "Dent": 0, "Scratch": 1, "Broken part": 2, "Paint chip": 3, "Missing part": 4,
    "Flaking": 5, "Corrosion": 6, "Cracked": 7
}

# Hasar modeli konfigürasyonu
cfg = get_cfg()
cfg.merge_from_file(model_zoo.get_config_file("COCO-InstanceSegmentation/mask_rcnn_R_101_FPN_3x.yaml"))
cfg.MODEL.ROI_HEADS.NUM_CLASSES = len(damage_category_mapping)
cfg.MODEL.WEIGHTS = r"C:\Users\kurt_\car-parts-and-damage-detection-v18\car-damage-detection\output_20241130_145334\model_final.pth"
cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.60
predictor = DefaultPredictor(cfg)

# Parça modeli konfigürasyonu
cfg_part = get_cfg()
cfg_part.merge_from_file(model_zoo.get_config_file("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml"))
cfg_part.MODEL.ROI_HEADS.NUM_CLASSES = len(part_category_mapping)
cfg_part.MODEL.WEIGHTS = r"C:\Users\kurt_\car-parts-and-damage-detection\car-part-detection\output_20241012_181751\model_final.pth"
cfg_part.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0.65
predictor_part = DefaultPredictor(cfg_part)

# Metadata tanımlamaları
damage_metadata = MetadataCatalog.get("damage_metadata")
damage_metadata.thing_classes = list(damage_category_mapping.keys())

part_metadata = MetadataCatalog.get("part_metadata")
part_metadata.thing_classes = list(part_category_mapping.keys())

@app.route('/detect_damage', methods=['POST'])
def detect_damage():
    try:
        # Resmi POST isteği ile al
        file = request.files.get('image')
        if not file:
            return jsonify({"error": "No image provided"}), 400

        # Görüntüyü OpenCV ile oku
        npimg = np.frombuffer(file.read(), np.uint8)
        img = cv2.imdecode(npimg, cv2.IMREAD_COLOR)

        # Görüntüyü yeniden boyutlandır (performans için)
        img = cv2.resize(img, (800, 600))

        # Hasar ve parça tahmini
        outputs = predictor(img)
        outputs_part = predictor_part(img)

        # Visualizer kullanarak sadece hasar maskelerini çizin
        v = Visualizer(img[:, :, ::-1], metadata=damage_metadata, scale=1.2)
        out = v.draw_instance_predictions(outputs["instances"].to("cpu"))

        # Görselleştirilmiş görüntüyü al
        visualized_img = out.get_image()[:, :, ::-1]

        # Sonuçları hazırlayın
        results = []
        if len(outputs["instances"]) > 0 and len(outputs_part["instances"]) > 0:
            part_boxes = outputs_part["instances"].pred_boxes
            part_classes = outputs_part["instances"].pred_classes

            damage_boxes = outputs["instances"].pred_boxes
            damage_classes = outputs["instances"].pred_classes

            # IoU hesapla
            iou_matrix = pairwise_iou(damage_boxes, part_boxes)
            max_iou_indices = iou_matrix.argmax(dim=1)

            for i, damage_idx in enumerate(max_iou_indices):
                part_label = part_classes[damage_idx].item()
                damage_label = damage_classes[i].item()

                part_name = list(part_category_mapping.keys())[list(part_category_mapping.values()).index(part_label)]
                damage_name = list(damage_category_mapping.keys())[list(damage_category_mapping.values()).index(damage_label)]

                results.append({
                    "damage": damage_name,
                    "part": part_name
                })

            # Resmi base64 formatına çevir (sıkıştırılmış olarak)
            _, img_encoded = cv2.imencode('.jpg', visualized_img, [int(cv2.IMWRITE_JPEG_QUALITY), 70])
            img_base64 = base64.b64encode(img_encoded).decode('utf-8')

            return jsonify({"detections": results, "image": img_base64})

        elif len(outputs_part["instances"]) > 0:
            # Parça tespit edildi ancak hasar tespit edilmedi
            return jsonify({
                "message": "No damage detected, but vehicle parts were identified.",
                "detections": [],
                "image": None
            })

        else:
            # Hiçbir şey tespit edilmedi
            return jsonify({
                "message": "No damage or parts detected. The vehicle appears to be undamaged.",
                "detections": [],
                "image": None
            })

    except Exception as e:
        # Hata durumunda loglama ve kullanıcıya bilgi verme
        app.logger.error(f"An error occurred: {str(e)}")
        return jsonify({"error": "An internal server error occurred"}), 500

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=7000, debug=False)