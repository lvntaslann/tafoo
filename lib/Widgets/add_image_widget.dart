import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Provider/car_damage_provider.dart';
import 'package:tafoo/Provider/storage_provider.dart';
import 'package:tafoo/Provider/share_car_provider.dart';

class AddImageWidget extends StatefulWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  // Resim yükleme kaynağı: kamera veya galeri
  bool isCameraImage = false;

  // Resim yükleme fonksiyonu
  void onTap() async {
    final source = isCameraImage ? ImageSource.camera : ImageSource.gallery;
    await uploadImageAndSaveData(source);
  }

  Future<void> uploadImageAndSaveData(ImageSource source) async {
    final storageProvider =
        Provider.of<StorageProvider>(context, listen: false);
    final carShareProvider =
        Provider.of<CarShareProvider>(context, listen: false);

    final carDamageDetect = Provider.of<CarDamageProvider>(context,listen:false);

    // Resim yükleme işlemi
    String? imageUrl = await storageProvider.uploadImage(source);
    if (imageUrl != null) {
      // URL'yi listeye ekle
      carDamageDetect.uploadImageFromUrl(imageUrl);
      carShareProvider.addImage([imageUrl]);
      await carShareProvider.saveCarData(isCameraImage);
    } else {

      print("Resim yüklenirken bir hata oluştu.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        width: 330,
        height: 250,
        decoration: BoxDecoration(
          color: Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isCameraImage = true; // Kamera seçildi
                  });
                  onTap(); // Resim yükleme işlemini başlat
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                )),
            SizedBox(height: 10),
            Text(
              "YA DA",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isCameraImage = false; // Galeri seçildi
                  });
                  onTap(); // Resim yükleme işlemini başlat
                },
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 50,
                )),
            SizedBox(height: 10),
            Text(
              "Görsel Ekle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
