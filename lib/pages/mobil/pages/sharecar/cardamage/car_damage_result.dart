import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/pages/mobil/pages/sharecar/cardamage/my_svg_widget.dart';


class CarDamageResult extends StatelessWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;

  CarDamageResult({required this.imageBytes, required this.detections});
  final User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
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
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: MySvgWidget(
                imageBytes: imageBytes,
                detections: detections,
                currentUser: currentUser!.uid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
