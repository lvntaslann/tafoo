import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';

class CarDetailGeneral extends StatelessWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;
const CarDetailGeneral({ Key? key, this.imageBytes, this.detections }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              AppBackButton(),
              if (imageBytes != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.memory(imageBytes!),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Detections:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (detections != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: detections!.map((detection) {
                      return Text(
                        "${detection['part']} - ${detection['damage']}",
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                ),
              SizedBox(height: 16),
            ]
        ),
      ),
      
    );
  }
}