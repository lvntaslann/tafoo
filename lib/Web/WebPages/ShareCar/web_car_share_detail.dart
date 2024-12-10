import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/my_svg_widget.dart';
import 'package:tafoo/Provider/share_car_provider.dart';
import 'package:tafoo/Web/WebPages/web_home_page.dart';
import 'package:tafoo/Widgets/Mobil/button/accept_share.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_car_image.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_choose_container.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_share_detail.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_share_title.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_shared_location.dart';
import 'package:tafoo/Widgets/Web/web_cost_value.dart';
import 'package:tafoo/Widgets/Web/web_go_profil_page.dart';

class WebCarShareDetail extends StatefulWidget {
  final Uint8List? imageBytes;
  final List<dynamic>? detections;
  const WebCarShareDetail({Key? key, this.imageBytes, this.detections})
      : super(key: key);

  @override
  _WebCarShareDetailState createState() => _WebCarShareDetailState();
}

class _WebCarShareDetailState extends State<WebCarShareDetail> {
  Map<String, dynamic>? carData;
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      carData = await Provider.of<CarShareProvider>(context, listen: false)
          .getCarDataById();
      if (carData != null) {
        setState(() {});
      }
    } catch (e) {
      print("Error fetching car data: $e");
    }
  }

  void goHomePage() {
    Provider.of<CarShareProvider>(context, listen: false)
        .resetSvgUploadStatus();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(onTap: goHomePage, child: const AcceptShare()),
            WebCarImage(
              size: size,
              url: carData?['image']?[0] ?? "firebasedeki resim",
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                WebShareTitle(),
                const SizedBox(width: 10),
                WebCostValue(),
              ],
            ),
            WebSharedCarLocation(),
            const SizedBox(height: 10),
            WebGoProfilPage(),
            const SizedBox(height: 10),
            WebChooseContainer(size: size),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: Column(
                children: [
                  WebShareDetail(
                    title: "Marka",
                    result: carData?['model'] ?? "Bmw",
                  ),
                  WebShareDetail(
                    title: "Seri",
                    result: carData?['serial'] ?? "İ3",
                  ),
                  WebShareDetail(
                    title: "Yıl",
                    result: carData?['year'] ?? "2021",
                  ),
                  WebShareDetail(
                    title: "Vites tipi",
                    result: carData?['gearType'] ?? "Otomatik",
                  ),
                  WebShareDetail(
                    title: "Yakıt tipi",
                    result: carData?['fuel'] ?? "Dizel",
                  ),
                  WebShareDetail(
                    title: "Kasa tipi",
                    result: carData?['carType'] ?? "Sedan",
                  ),
                  WebShareDetail(
                    title: "Kilometre",
                    result: carData?['kilometre'] ?? "100000Km",
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 600),
              child: MySvgWidget(
                  imageBytes: widget.imageBytes,
                  detections: widget.detections,
                  currentUser: currentUser?.uid ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
