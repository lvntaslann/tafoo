import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_provider.dart';

class MySvgWidget extends StatelessWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;
  final String? currentUser;

  MySvgWidget({
    required this.imageBytes,
    required this.detections,
    required this.currentUser,
  });

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  @override
Widget build(BuildContext context) {
  final svgUploadStatus = Provider.of<CarShareProvider>(context, listen: false);
  return FutureBuilder<String>(
    future: _loadAndShowSvg(context),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("Hasar detayı yükleniyor...");
      } else if (snapshot.hasData) {
        if (!svgUploadStatus.isSvgUploaded) {
          _uploadModifiedSvg(context, snapshot.data!);
        }
        return SvgPicture.string(snapshot.data!, width: 300, height: 300);
      } else {
        return Center(child: Text('SVG yüklenmedi.'));
      }
    },
  );
}

  Future<String> _loadAndShowSvg(BuildContext context) async {
    String svgString = await DefaultAssetBundle.of(context)
        .loadString('assets/images/car-body.svg');
    return _applyDetections(svgString);
  }

  String _applyDetections(String svgString) {
    if (detections != null && detections!.isNotEmpty) {
      for (var detection in detections!) {
        String part = detection['part'];
        String color = _getColorForDamage(detection['damage']);
        RegExp regExp = RegExp(r'<[^>]*id="' + part + r'".*?>');

        if (regExp.hasMatch(svgString)) {
          svgString = svgString.replaceAllMapped(
            regExp,
            (match) {
              String matchedPart = match.group(0)!;
              if (matchedPart.contains('fill=')) {
                return matchedPart.replaceAll(
                    RegExp(r'fill="[^"]*"'), 'fill="$color"');
              } else {
                return matchedPart.replaceFirst('>', ' fill="$color">');
              }
            },
          );
        } else {
          print("SVG'de id='$part' bulunamadı.");
        }
      }
    } else {
      print("Tespit edilecek bir parça bulunamadı.");
    }
    return svgString;
  }

  Future<void> _uploadModifiedSvg(
      BuildContext context, String svgString) async {
    final svgUploadStatus =
        Provider.of<CarShareProvider>(context, listen: false);

    Uint8List svgBytes = Uint8List.fromList(svgString.codeUnits);
    String filePath =
        'svg_file/$currentUser/${DateTime.now().millisecondsSinceEpoch}.svg';
    try {
      final uploadTask = await firebaseStorage.ref(filePath).putData(svgBytes);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      print(
          "Düzenlenmiş SVG dosyası Storage'a yüklendi ve URL alındı: $downloadUrl");
      svgUploadStatus.addSvgFile(downloadUrl);
    } catch (e) {
      print("SVG dosyası yüklenirken hata oluştu: $e");
    }
  }

  String _getColorForDamage(String damage) {
    switch (damage) {
      case 'Dent':
        return '#FE7F21'; // Turuncu
      case 'Scratch':
        return '#FFEE07'; // Sarı
      case 'Broken part':
        return '#03FF03'; // Yeşil
      case 'Paint chip':
        return '#C404FF'; // Mor
      case 'Missing part':
        return '#0B8BFC'; // Mavi
      case 'Flaking':
        return '#FF0000'; // Kırmızı
      case 'Corrosion':
        return '#926363'; // Kahverengi
      case 'Cracked':
        return '#73F5F8'; // Açık mavi
      default:
        return 'black';
    }
  }
}
