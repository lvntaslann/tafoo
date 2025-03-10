import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tafoo/Widgets/Web/NavBatItem/web_navbar.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_car_image.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_choose_container.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_share_detail.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_share_title.dart';
import 'package:tafoo/Widgets/Web/ShareCar/web_shared_location.dart';
import 'package:tafoo/Widgets/Web/web_cost_value.dart';
import 'package:tafoo/Widgets/Web/web_go_profil_page.dart';

class WebMyGarageDetail extends StatelessWidget {
  final Map<String, dynamic> carData;
  final String tag;
  const WebMyGarageDetail({Key? key, required this.carData, required this.tag})
      : super(key: key);

  @override
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
            WebNavBar(size: size),
            WebCarImage(
              tag: tag,
              size: size,
              url: carData['image']?[0] ?? "firebasedeki resim",
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
                    result: carData['model'] ?? "Bmw",
                  ),
                  WebShareDetail(
                    title: "Seri",
                    result: carData['serial'] ?? "İ3",
                  ),
                  WebShareDetail(
                    title: "Yıl",
                    result: carData['year'] ?? "2021",
                  ),
                  WebShareDetail(
                    title: "Vites tipi",
                    result: carData['gearType'] ?? "Otomatik",
                  ),
                  WebShareDetail(
                    title: "Yakıt tipi",
                    result: carData['fuel'] ?? "Dizel",
                  ),
                  WebShareDetail(
                    title: "Kasa tipi",
                    result: carData['carType'] ?? "Sedan",
                  ),
                  WebShareDetail(
                    title: "Kilometre",
                    result: carData['kilometre'] ?? "100000Km",
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SVG Görseli
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SvgPicture.network(
                      carData['svgFile'],
                      width: 300,
                      height: 300,
                      placeholderBuilder: (BuildContext context) =>
                          const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // PNG/JPEG Görseli
                Center(
                  child: Container(
                    width: 450,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        carData['imageFile'],
                        fit: BoxFit.cover,
                        width: 800,
                        height: 350,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
            SizedBox(height: 40),
          ],
          
        ),
      ),
    );
  }
}
