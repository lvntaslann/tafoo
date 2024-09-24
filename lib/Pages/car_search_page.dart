// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/back_button.dart';
import 'package:tafoo/Widgets/search_bar.dart';

class CarSearchPage extends StatefulWidget {
  const CarSearchPage({Key? key}) : super(key: key);

  @override
  State<CarSearchPage> createState() => _CarSearchPageState();
}

class _CarSearchPageState extends State<CarSearchPage> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: AppBackButton()),
          SizedBox(height: 30),
          MySearchBar(),
          SizedBox(height: 30),
          SelectTypeContainer(size: size, isSelected: isSelected),
          Container(
  height: size.height * 0.67,
  width: size.width,
  decoration: BoxDecoration(
    color: Colors.white,
  ),
  child: Column(
    children: [
      CarType(image: 'assets/images/car.png', title: 'Otomobil', number: '91.234'),
      CarType(image: 'assets/images/suv.png', title: 'Arazi,Suv,Pick-up', number: '12.123'),
      CarType(image: 'assets/images/motorcycle.png', title: 'Motosiklet', number: '2.343'),
      CarType(image: 'assets/images/pickup.png', title: 'Ticari Araçlar', number: '1.234'),
      CarType(image: 'assets/images/broken-car.png', title: 'Hasarlı Araçlar', number: '9.254'),

    ],
  )
),

        ],
      ),
    );
  }
}

class CarType extends StatelessWidget {
  final String image;
  final String title;
  final String number;
  const CarType({
    super.key, required this.image, required this.title, required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 20),
            CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(254, 127, 33, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            Text(
              number,
              style: TextStyle(
                color: Color.fromRGBO(164, 164, 164, 1.0),
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Divider ile Row arasına boşluk ekleyelim
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10), // Divider'ı biraz sağa ve sola boşluk ekle
          child: Divider(
            color: Colors.grey, // Divider'ın rengi
            thickness: 1,       // Divider kalınlığı
          ),
        ),
      ],
    );
  }
}

class SelectTypeContainer extends StatelessWidget {
  const SelectTypeContainer({
    super.key,
    required this.size,
    required this.isSelected,
  });

  final Size size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height * 0.04,
        decoration: BoxDecoration(
          color: Color(0xFFE8E6E6),
        ),
        child: Row(
          children: [
            SizedBox(width: 30),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Ortalamak için
              children: [
                Text(
                  "Kategori",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 93, 93, 1.0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isSelected)
                  Container(
                    height: 1, // Çizginin kalınlığı
                    width: 60, // Çizginin genişliği
                    color: Color(0xFFFE7F21), // Çizginin rengi
                    margin: EdgeInsets.only(
                        top: 4), // Yazıyla çizgi arasında boşluk
                  ),
              ],
            ),
            SizedBox(width: 30),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Ortalamak için
              children: [
                Text(
                  "Vitrin",
                  style: TextStyle(
                    color: Color.fromRGBO(94, 93, 93, 1.0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // "Vitrin" için bir çizgi yok, isSelected değeri sadece "Kategori" için geçerli
              ],
            ),
          ],
        ));
  }
}
