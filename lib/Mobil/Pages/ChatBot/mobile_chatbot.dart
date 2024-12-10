import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tafoo/Mobil/Pages/ChatBot/chat_page.dart';
import 'package:tafoo/Widgets/Mobil/button/my_button.dart';

class MobileChatbot extends StatefulWidget {
  const MobileChatbot({Key? key}) : super(key: key);

  @override
  _MobileChatbotState createState() => _MobileChatbotState();
}

class _MobileChatbotState extends State<MobileChatbot> {
  void goToChatBot() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.asset("assets/images/lottie.json"),
          MyButton(
            onTap: goToChatBot,
            text: "Try tafooAI...",
          ),
          Text(
            "Dilediğiniz sorularu sorabilirsiniz...",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "TafooAI hatalar yapabilir",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
