import 'package:flutter/material.dart';
import 'package:tafoo/Mobil/Pages/home_page.dart';
import 'package:tafoo/WebPages/web_home_page.dart';

class BasePage extends StatelessWidget {
const BasePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return WebHomePage();
          } else {
            return HomePage();
          }
        },
      );
  }
}