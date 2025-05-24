import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/car_damage_provider.dart';


class WebAddImageWidgetGeneral extends StatefulWidget {
  const WebAddImageWidgetGeneral({Key? key}) : super(key: key);

  @override
  _WebAddImageWidgetGeneralState createState() => _WebAddImageWidgetGeneralState();
}

class _WebAddImageWidgetGeneralState extends State<WebAddImageWidgetGeneral> {
  Uint8List? _selectedImage;
  String? _fileName;
  late final CarDamageProvider carDamageProvider;
  Future<void> onTap() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _selectedImage = result.files.first.bytes;
        _fileName = result.files.first.name;
      });
      await uploadImageAndSaveData();
      print("dosya yüklendi");
      print("tamamlandı");
    } else {
      print("Dosya seçimi iptal edildi.");
    }
  }

 
  Future<void> uploadImageAndSaveData() async {
    if (_selectedImage != null && _fileName != null) {
      final carDamageProvider = Provider.of<CarDamageProvider>(context, listen: false);
      await carDamageProvider.uploadImageFromBytes(_selectedImage!, _fileName!);
      
    } else {
      print("Yüklemek için geçerli bir dosya bulunamadı.");
    }
  }


@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 450),
      child: Container(
        width: 600,
        height: 340,
        decoration: BoxDecoration(
          color: Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            //Image.asset("assets/images/plus.png",width: 100,height: 100,),
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 100,
                  color: Color(0XFFFE7F21),
                )),
            SizedBox(height: 10),
            Text(
              "Görsel Ekle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
