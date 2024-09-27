// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/button/accept_share.dart';
import 'package:tafoo/Widgets/button/back_button.dart';
import 'package:tafoo/Widgets/car_image.dart';
import 'package:tafoo/Widgets/car_share_title.dart';
import 'package:tafoo/Widgets/cost_value.dart';
import 'package:tafoo/Widgets/go_ai_details.dart';
import 'package:tafoo/Widgets/go_profil_page.dart';
import 'package:tafoo/Widgets/shared_car_location.dart';
import 'package:tafoo/Widgets/shared_detail.dart';

class SharedCarDetails extends StatefulWidget {
   final String tag;
  const SharedCarDetails({Key? key, required this.tag}) : super(key: key);
  
  @override
  _SharedCarDetailsState createState() => _SharedCarDetailsState();
}

class _SharedCarDetailsState extends State<SharedCarDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              child: Row(
            children: [
              AppBackButton(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 50,
                ),
                child: Text(
                  "İlan önizlemesi",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF5E5D5D)),
                ),
              ),
              SizedBox(width: 40),
              AcceptShare()
            ],
          )),
          SizedBox(height: 20),
          //Araçların resimlerinin gözükeceği yer
          CarImage(tag: widget.tag,),
          SizedBox(height: 5),
          //aracın paylaşılan başlığı
          CarShareTitle(),
          SizedBox(
            height: 10
          ),
          //konum bilgisi
          Location(),
          //fiyat bilgisi
          CostValue(),
          SizedBox(height: 10),
          //yapay zeka sonuçlarını görmek için
          GoAiResult(),
          SizedBox(height: 10),
          //profil sayfası oluşturulduktan sonra eklenicek
          GoProfilPage(),
          SizedBox(height: 10),
          // ilan bilgileri,açıklama,hizmetler
          ChooseContainer(size: size),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                  ShareDetail(title: "Marka",result: "Bwm",),
                  ShareDetail(title: "Seri",result: "İ3",),
                  ShareDetail(title: "Yıl",result: "2021",),
                  ShareDetail(title: "Vites tipi",result: "Otomatik",),
                  ShareDetail(title: "Yakıt tipi",result: "Dizel",),
                  ShareDetail(title: "Kasa tipi",result: "Sedan",),
                  ShareDetail(title: "Kilometre",result: "100000Km",),
                  ShareDetail(title: "Kasa tipi",result: "Sedan",),
                  ShareDetail(title: "Kasa tipi",result: "Sedan",),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChooseContainer extends StatelessWidget {
  const ChooseContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 36,
      decoration: BoxDecoration(
        color: Color(0xFFE8E6E6),
      ),
      child: Row(
        children: [
          SizedBox(width: 50),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Text(
                "İlan bilgileri",
                style: TextStyle(
                  color: Color.fromRGBO(94, 93, 93, 1.0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 1,
                width: 80,
                color: Color(0xFFFE7F21),
                margin: EdgeInsets.only(
                    top: 4),
              ),
            ],
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Text(
                "Açıklama",
                style: TextStyle(
                  color: Color.fromRGBO(94, 93, 93, 1.0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Text(
                "Hizmetler",
                style: TextStyle(
                  color: Color.fromRGBO(94, 93, 93, 1.0),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

















