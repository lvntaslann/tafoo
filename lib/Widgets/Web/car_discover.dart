import 'package:flutter/material.dart';
import 'package:tafoo/Mobil/Pages/sharecar/shared_car_details.dart';

class CarDiscover extends StatefulWidget {
  const CarDiscover({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  _CarDiscoverState createState() => _CarDiscoverState();
}

class _CarDiscoverState extends State<CarDiscover> {
  int? _hoveredIndex; // Fare üzerine gelinen öğenin index'ini tutmak için

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Keşfet",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFE7F21),
                  ),
                ),
                Container(
                  height: widget.size.height * 0.50, // Yüksekliği ekran boyutuna göre ayarlıyoruz
                  width: widget.size.width, // Genişliği ekran boyutuna göre ayarlıyoruz
                  decoration: BoxDecoration(
                    color: Color(0XFFFAFAFA),
                  ),
                  child: Wrap(
                    spacing: 10, // Elemanlar arasındaki yatay boşluk
                    runSpacing: 10, // Elemanlar arasındaki dikey boşluk
                    children: List.generate(
                      8, // Toplamda 8 adet öğe olacak
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SharedCarDetails(tag: 'car_$index'),
                            ),
                          );
                        },
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              _hoveredIndex = index; // Fare gelince o öğeyi seçiyoruz
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              _hoveredIndex = null; // Fare çıkınca seçim yok
                            });
                          },
                          child: Container(
                            width: (widget.size.width - 100) / 4, // Genişliği 4'e bölüyoruz
                            height: 210,
                            decoration: BoxDecoration(
                              color: Color(0XFFffffff),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: "car_$index",
                                  child: Center(
                                    child: AnimatedScale(
                                      scale: _hoveredIndex == index
                                          ? 1.1 // Sadece fare üzerine gelen öğede scale işlemi olacak
                                          : 1.0,
                                      duration: Duration(milliseconds: 300), // Animasyon süresi
                                      child: Image.asset(
                                        "assets/images/carbmw.png",
                                        width: 164,
                                        height: 108,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "İstanbul",
                                        style: TextStyle(
                                          color: Color(0XFF5E5D5D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "Sahibinden\nhatasız araba",
                                        style: TextStyle(
                                          color: Color(0XFF898989),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 220),
                                        child: Text(
                                          "1.500.000 TL",
                                          style: TextStyle(
                                              color: Color(0XFFFE7F21),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}