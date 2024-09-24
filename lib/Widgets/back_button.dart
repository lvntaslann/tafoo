

import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/rounded_border_with_icon.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: RoundedBorderWithIcon(icon: Icons.arrow_back),
      ),
    );
  }
}