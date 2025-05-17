import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isInstructButton;
  const MyButton({
    super.key, required this.onTap, required this.text, required this.isInstructButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: isInstructButton! ? 60:200,
        height: isInstructButton! ? 40:50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFE7F21),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
