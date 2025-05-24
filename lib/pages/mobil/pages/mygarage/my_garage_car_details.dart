import 'package:flutter/material.dart';
import 'package:tafoo/pages/mobil/pages/mygarage/my_garage_car_damage_result.dart';
import 'package:tafoo/pages/mobil/pages/sharecar/shared_car_details.dart';
import 'package:tafoo/widgets/mobil/button/back_button.dart';
import 'package:tafoo/widgets/car_image.dart';
import 'package:tafoo/widgets/car_share_title.dart';
import 'package:tafoo/widgets/cost_value.dart';
import 'package:tafoo/widgets/go_ai_details.dart';
import 'package:tafoo/widgets/go_profil_page.dart';
import 'package:tafoo/widgets/shared_car_location.dart';
import 'package:tafoo/widgets/shared_detail.dart';




class MyGarageCarDetails extends StatefulWidget {
  final Map<String, dynamic> carData;
  final String tag;
  const MyGarageCarDetails({Key? key, required this.carData, required this.tag})
      : super(key: key);

  @override
  _MyGarageCarDetailsState createState() => _MyGarageCarDetailsState();
}

class _MyGarageCarDetailsState extends State<MyGarageCarDetails> {
  void goAiResult() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyGarageCarDamageResult(
          url: widget.carData['svgFile'],
          image: widget.carData['imageFile'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Row(
              children: [
                const AppBackButton(),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 50),
                  child: Text(
                    "İlan önizlemesi",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF5E5D5D),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CarImage(
            tag: widget.tag,
            url: widget.carData['image']?[0] ?? "firebasedeki resim",
          ),
          const SizedBox(height: 5),
          CarShareTitle(
            title: widget.carData['adTitle'] ?? "Sahibinden hasarsız araba",
          ),
          const SizedBox(height: 10),
          Location(location: widget.carData['location'] ?? "Belirtilmemiş"),
          CostValue(cost: widget.carData['carCost'] ?? "1.500.000TL"),
          const SizedBox(height: 10),
          GoAiResult(onTap: goAiResult),
          const SizedBox(height: 10),
          const GoProfilPage(),
          const SizedBox(height: 10),
          ChooseContainer(size: size),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShareDetail(
                    title: "Marka",
                    result: widget.carData['model'] ?? "Bmw",
                  ),
                  ShareDetail(
                    title: "Seri",
                    result: widget.carData['serial'] ?? "İ3",
                  ),
                  ShareDetail(
                    title: "Yıl",
                    result: widget.carData['year'] ?? "2021",
                  ),
                  ShareDetail(
                    title: "Vites tipi",
                    result: widget.carData['gearType'] ?? "Otomatik",
                  ),
                  ShareDetail(
                    title: "Yakıt tipi",
                    result: widget.carData['fuel'] ?? "Dizel",
                  ),
                  ShareDetail(
                    title: "Kasa tipi",
                    result: widget.carData['carType'] ?? "Sedan",
                  ),
                  ShareDetail(
                    title: "Kilometre",
                    result: widget.carData['kilometre'] ?? "100000Km",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
