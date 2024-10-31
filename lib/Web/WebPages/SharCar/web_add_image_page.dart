import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_add_image_container_widget.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_add_image_text_widget.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_ai_waiting_page.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_share_image_car_button.dart';

class WebAddImagePage extends StatefulWidget {
  const WebAddImagePage({Key? key}) : super(key: key);

  @override
  _WebAddImagePageState createState() => _WebAddImagePageState();
}

void onTap(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebAiWaitingPage()));
}
class _WebAddImagePageState extends State<WebAddImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          web_add_image_text_widget(),
          SizedBox(height: 30),
          web_add_image_container_widget(),
          SizedBox(height: 30),
          web_share_image_car_button(ontap: () => onTap(context))
        ],
      ),
    );
  }
}






