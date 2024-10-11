import 'package:flutter/material.dart';

class WebShareCarButton extends StatelessWidget {
  final Function() onTap;
  const WebShareCarButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: SizedBox(
        width: 50,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFCDCCCC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}