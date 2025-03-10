import 'package:flutter/material.dart';
import 'package:tafoo/Web/WebPages/GeneralCarDamageDetection/web_add_image_widget_general.dart';
import 'package:tafoo/Web/WebPages/GeneralCarDamageDetection/web_ai_waiting_general.dart';
import 'package:tafoo/Widgets/Mobil/button/my_button.dart';


class WebAddImageGeneral extends StatefulWidget {
  const WebAddImageGeneral({ Key? key }) : super(key: key);

  @override
  _WebAddImageGeneralState createState() => _WebAddImageGeneralState();
}

class _WebAddImageGeneralState extends State<WebAddImageGeneral> {
  void onTap() async{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebAiWaitingGeneral()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:30),
          WebAddImageWidgetGeneral(),
          SizedBox(height: 50),
          MyButton(onTap: onTap, text: "yapay zeka test sonucu..",isInstructButton: false,)
        ],
      ),

    );
  }
}