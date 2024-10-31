import 'package:flutter/material.dart';

class web_share_image_car_button extends StatelessWidget {
  final Function() ontap;
  const web_share_image_car_button({
    super.key, required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 650),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          onPressed: ontap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFE7F21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            "Yapay zeka analizi",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}