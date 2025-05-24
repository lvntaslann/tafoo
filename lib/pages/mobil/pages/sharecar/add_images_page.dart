import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/add_image_widget.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/Widgets/Mobil/button/my_button.dart';
import 'package:tafoo/Widgets/Mobil/text/my_third_text_widget.dart';

import 'ai_waiting_page.dart';

class AddImagesPage extends StatefulWidget {
  const AddImagesPage({ Key? key }) : super(key: key);

  @override
  _AddImagesPageState createState() => _AddImagesPageState();
}

class _AddImagesPageState extends State<AddImagesPage> {
  
  void onTap() async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AiWaitingPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: AppBackButton()),
          MyThirdTextWidget(),
          SizedBox(height:30),
          AddImageWidget(),
          SizedBox(height: 50),
          MyButton(onTap: onTap,text: "Yapay zeka analizi",isInstructButton: false,),
        ],
      ),

    );
  }
}





