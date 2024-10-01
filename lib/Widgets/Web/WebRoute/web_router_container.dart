import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Web/WebRoute/my_web_default_container.dart';

class RouterContainer extends StatelessWidget {
  const RouterContainer({
    super.key,
  });

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
          onTap: () => (),
        ),
        MyWebDefaultContainer(
          text: "İlan ver",
          description: "Ücretsiz ilan ver\n60 güne kadar yayında kalsın!",
          image: "assets/images/add-icon-logo.png",
          height: 180,
          width: 180,
          isNumber: false,
          isAiOto: false,
          onTap: () => (),
        ),
        MyWebDefaultContainer(
          text: "Araban kaç para?",
          description: "Arabanın gerçek\npiyasa değerini öğren!",
          height: 180,
          width: 185,
          isNumber: false,
          isAiOto: false,
          onTap: () => (),
        ),
        MyWebDefaultContainer(
          text: "Garaj",
          description: "Aracının periyodik\nbakımlarını takip et!",
          image: "assets/images/garage.png",
          height: 180,
          width: 185,
          isNumber: false,
          isAiOto: false,
          onTap: () => (),
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