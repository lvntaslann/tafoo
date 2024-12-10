import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const MyButton({
    super.key, required this.onTap, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 50,
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
