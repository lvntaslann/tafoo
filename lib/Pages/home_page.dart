import 'package:flutter/material.dart';
import 'package:tafoo/Pages/car_search_page.dart';
import 'package:tafoo/Pages/sharecar/share_car.dart';
import 'package:tafoo/Widgets/default_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void page(int value) {
    if (value == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CarSearchPage()));
    else if (value == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShareCar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  // Orange background
                  Container(
                    height: size.height * 0.33,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(254, 127, 33, 1.0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alırken, Satarken \nkullanırken",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/tafoologo.png",
                                height: 100, // Resmin boyutunu ayarla
                              ),
                              Text(
                                "Hep yanında!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 210),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DefaultContainer(
                              text: "İlan ara",
                              description: "Hayalindeki aracı\nbul!",
                              image: "assets/images/searchcar.png",
                              height: size.height * 0.18,
                              width: size.width * 0.40,
                              isNumber: true,
                              isAiOto: false,
                              onTap: () => page(0),
                            ),
                            DefaultContainer(
                              text: "İlan ver",
                              description:
                                  "Ücretsiz ilan ver 60\ngüne kadar yayında\nkalsın!",
                              image: "assets/images/add-icon-logo.png",
                              height: size.height * 0.18,
                              width: size.width * 0.40,
                              isNumber: false,
                              isAiOto: false,
                              onTap: ()=>page(1),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DefaultContainer(
                              text: "Aracımın fiyatı ne kadar ?",
                              description:
                                  "Aracının gerçek piyasa\ndeğerini yapay\nzeka ile öğren!",
                              height: size.height * 0.18,
                              width: size.width * 0.40,
                              isNumber: false,
                              isAiOto: false,
                            ),
                            DefaultContainer(
                              text: "Garaj",
                              description:
                                  "Aracının periyodik bakımlarını takip et",
                              image: "assets/images/garage.png",
                              height: size.height * 0.18,
                              width: size.width * 0.40,
                              isNumber: false,
                              isAiOto: false,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DefaultContainer(
                              text: "AI OTO EKSPERTİZ",
                              description:
                                  "Doğruluk oranı yüksek olan yapay\nzeka desteği ile aracını test et!",
                              image: "assets/images/ai_oto.png",
                              height: size.height * 0.30,
                              width: size.width * 0.85,
                              isNumber: false,
                              isAiOto: true,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
