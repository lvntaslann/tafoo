// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/home_page.dart';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/car_damage_result.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_provider.dart';
import 'package:tafoo/Widgets/Mobil/button/accept_share.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/Widgets/car_image.dart';
import 'package:tafoo/Widgets/car_share_title.dart';
import 'package:tafoo/Widgets/cost_value.dart';
import 'package:tafoo/Widgets/go_ai_details.dart';
import 'package:tafoo/Widgets/go_profil_page.dart';
import 'package:tafoo/Widgets/shared_car_location.dart';
import 'package:tafoo/Widgets/shared_detail.dart';

class SharedCarDetails extends StatefulWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;
  final String? tag;

  const SharedCarDetails({Key? key, this.tag, this.imageBytes, this.detections})
      : super(key: key);

  @override
  _SharedCarDetailsState createState() => _SharedCarDetailsState();
}

class _SharedCarDetailsState extends State<SharedCarDetails> {
  Map<String, dynamic>? carData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    carData = await Provider.of<CarShareProvider>(context, listen: false).getCarDataById();
    if (carData != null) {
      setState(() {});
    }
  }

  void goAiResult() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarDamageResult(
            imageBytes: widget.imageBytes, detections: widget.detections),
      ),
    );
  }

  void goHomePage() {
    Provider.of<CarShareProvider>(context, listen: false).resetSvgUploadStatus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: carData == null 
          ? const Center(child: CircularProgressIndicator())
          : Column(
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
                      GestureDetector(onTap: goHomePage, child: const AcceptShare()),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CarImage(
                  tag: widget.tag ?? "",
                  url: carData!['image']?[0] ?? "firebasedeki resim",
                ),
                const SizedBox(height: 5),
                CarShareTitle(
                  title: carData!['adTitle'] ?? "Sahibinden hasarsız araba",
                ),
                const SizedBox(height: 10),
                Location(location: carData!['location'] ?? "Belirtilmemiş"),
                CostValue(cost: carData!['carCost'] ?? "1.500.000TL"),
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
                          result: carData!['model'] ?? "Bmw",
                        ),
                        ShareDetail(
                          title: "Seri",
                          result: carData!['serial'] ?? "İ3",
                        ),
                        ShareDetail(
                          title: "Yıl",
                          result: carData!['year'] ?? "2021",
                        ),
                        ShareDetail(
                          title: "Vites tipi",
                          result: carData!['gearType'] ?? "Otomatik",
                        ),
                        ShareDetail(
                          title: "Yakıt tipi",
                          result: carData!['fuel'] ?? "Dizel",
                        ),
                        ShareDetail(
                          title: "Kasa tipi",
                          result: carData!['carType'] ?? "Sedan",
                        ),
                        ShareDetail(
                          title: "Kilometre",
                          result: carData!['kilometre'] ?? "100000Km",
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                margin: EdgeInsets.only(top: 4),
              ),
            ],
          ),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
