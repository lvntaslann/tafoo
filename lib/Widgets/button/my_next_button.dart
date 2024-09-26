import 'package:flutter/material.dart';

class MyNextButton extends StatelessWidget {
  final Function()? onTap;
  const MyNextButton({
    super.key, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
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
          child: Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
    );
  }
}