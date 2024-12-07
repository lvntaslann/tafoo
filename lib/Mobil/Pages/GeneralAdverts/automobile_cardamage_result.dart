import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';

class AutomobileCardamageResult extends StatelessWidget {
  final String url;
const AutomobileCardamageResult({ Key? key, required this.url }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          const AppBackButton(),
          Image.network(url),
        ],
      ),
    );
  }
}