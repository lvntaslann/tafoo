import 'package:flutter/material.dart';
import 'package:tafoo/Web/WebPages/ChatBot/web_chat_bot.dart';
import 'package:tafoo/Web/WebPages/GeneralAdverts/web_general_adverts.dart';
import 'package:tafoo/Web/WebPages/ShareCar/web_share_car_page.dart';
import 'package:tafoo/Web/WebPages/MyGarage/web_my_garage.dart';
import 'package:tafoo/Widgets/Web/WebRoute/my_web_default_container.dart';

class RouterContainer extends StatefulWidget {
  const RouterContainer({
    super.key,
  });

  @override
  State<RouterContainer> createState() => _RouterContainerState();
}

class _RouterContainerState extends State<RouterContainer> {
    void page(int value) {
    if (value == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>WebGeneralAdverts()));
    else if (value == 1)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WebShareCarPage()));
    else if (value == 2)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WebChatBot()));
    else if (value == 3)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>WebMyGarage() ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyWebDefaultContainer(
          text: "İlan ara",
          description: "Hayalindeki aracı\nbul!",
          image: "assets/images/searchcar.png",
          height: 180,
          width: 185,
          isNumber: true,
          isAiOto: false,
          onTap: () => page(0),
        ),
        MyWebDefaultContainer(
          text: "İlan ver",
          description: "Ücretsiz ilan ver\n60 güne kadar yayında kalsın!",
          image: "assets/images/add-icon-logo.png",
          height: 180,
          width: 180,
          isNumber: false,
          isAiOto: false,
          onTap: () => page(1),
        ),
        MyWebDefaultContainer(
          text: "TafooAI ile tanışın",
          description: "Aklına gelen tüm soruları\n sorabilirsin...",
          height: 180,
          width: 185,
          isNumber: false,
          isAiOto: false,
          onTap: () => page(2),
        ),
        MyWebDefaultContainer(
          text: "Garaj",
          description: "Aracının periyodik\nbakımlarını takip et!",
          image: "assets/images/garage.png",
          height: 180,
          width: 185,
          isNumber: false,
          isAiOto: false,
          onTap: () => page(3),
        ),
        MyWebDefaultContainer(
          text: "AI OTO EKSPERTİZ",
          description:
              "Doğruluk oranı yüksek olan yapay\nzeka desteği ile aracını test et!",
          image: "assets/images/ai_oto.png",
          height: 200,
          width: 350,
          isNumber: false,
          isAiOto: true,
        )
      ],
    );
  }
}