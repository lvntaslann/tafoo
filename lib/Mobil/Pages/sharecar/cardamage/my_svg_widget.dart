import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MySvgWidget extends StatelessWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections; 

  MySvgWidget({required this.imageBytes, required this.detections});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadSvg(context), // SVG dosyasını yükler
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else {
          String svgString = snapshot.data!;

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

          return SvgPicture.string(svgString);
        }
      },
    );
  }

  Future<String> _loadSvg(BuildContext context) async {
    // SVG dosyasını yükleyin
    return await DefaultAssetBundle.of(context).loadString('assets/images/car-body.svg');
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
