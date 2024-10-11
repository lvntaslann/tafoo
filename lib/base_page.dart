import 'package:flutter/material.dart';
import 'package:tafoo/Mobil/splash_screen.dart';
import 'package:tafoo/Web/WebPages/Auth/web_login_page.dart';




class BasePage extends StatelessWidget {
const BasePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return WebLoginPage();
          } else {
            return SplashScreen();
          }
        },
      );
  }
}