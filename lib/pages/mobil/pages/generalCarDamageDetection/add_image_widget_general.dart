import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../services/car_damage_provider.dart';


class AddImageWidgetGeneral extends StatefulWidget {
  const AddImageWidgetGeneral({Key? key}) : super(key: key);

  @override
  _AddImageWidgetGeneralState createState() => _AddImageWidgetGeneralState();
}

class _AddImageWidgetGeneralState extends State<AddImageWidgetGeneral> {
  final ImagePicker _picker = ImagePicker();

  // Resim yükleme kaynağı: kamera veya galeri
  bool isCameraImage = false;

  // Resim yükleme fonksiyonu
  Future<void> onTap() async {
    final source = isCameraImage ? ImageSource.camera : ImageSource.gallery;

    // Resmi seç
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      await uploadImage(pickedFile);
    } else {
      print("Resim seçimi iptal edildi.");
    }
  }

  // Resmi yükleme fonksiyonu
  Future<void> uploadImage(XFile pickedFile) async {
    final carDamageProvider =
        Provider.of<CarDamageProvider>(context, listen: false);

    try {
      // Resmi yükle
      await carDamageProvider.uploadImageFromFile(pickedFile);
      print("Image successfully uploaded and processed.");
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Center(
        child: Container(
          width: 330,
          height: 250,
          decoration: BoxDecoration(
            color: const Color(0XFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isCameraImage = true; // Kamera seçildi
                  });
                  onTap(); // Resim yükleme işlemini başlat
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "YA DA",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isCameraImage = false; // Galeri seçildi
                  });
                  onTap(); // Resim yükleme işlemini başlat
                },
                icon: const Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Görsel Ekle",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}