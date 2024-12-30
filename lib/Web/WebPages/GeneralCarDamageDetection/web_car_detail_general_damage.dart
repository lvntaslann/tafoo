import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:tafoo/Web/WebPages/web_home_page.dart';

class WebCarDetailGeneralDamage extends StatefulWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;
  const WebCarDetailGeneralDamage({Key? key, this.imageBytes, this.detections})
      : super(key: key);

  @override
  State<WebCarDetailGeneralDamage> createState() =>
      _WebCarDetailGeneralDamageState();
}

class _WebCarDetailGeneralDamageState extends State<WebCarDetailGeneralDamage> {
  void onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            SizedBox(height: 30),
            if (widget.imageBytes != null)
               Center(
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  widget.imageBytes!,
                  fit: BoxFit.cover,
                  width: 500,
                  height: 350,
                ),
              ),
            ),
          ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Detections:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            if (widget.detections != null)
              ...widget.detections!.map((detection) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${detection['part']} - ${detection['damage']}",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
            IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
