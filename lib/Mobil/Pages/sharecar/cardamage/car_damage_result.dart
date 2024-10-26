import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/my_svg_widget.dart';

class CarDamageResult extends StatelessWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;

  CarDamageResult({required this.imageBytes, required this.detections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Damage Detection Result"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            MySvgWidget(imageBytes: imageBytes, detections: detections),
          ],
        ),
      ),
    );
  }
}
