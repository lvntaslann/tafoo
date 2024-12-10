import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tafoo/Web/WebPages/ChatBot/web_chat_page.dart';

import '../../../Widgets/Mobil/button/my_button.dart';

class WebChatBot extends StatefulWidget {
const WebChatBot({ Key? key }) : super(key: key);

  @override
  State<WebChatBot> createState() => _WebChatBotState();
}

class _WebChatBotState extends State<WebChatBot> {
void goToChatBot()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset("assets/images/lottie.json",width: 400,height: 400,),
          MyButton(onTap: goToChatBot,text: "Try tafooAI...",),
          SizedBox(height: 100),
          Text("Dilediğiniz soruları sorabilirsiniz...",style: TextStyle(color: Colors.black),),
          Text("TafooAI hatalar yapabilir",style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}