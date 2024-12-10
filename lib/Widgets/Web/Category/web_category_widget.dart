import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Web/Category/web_car_type.dart';

class WebCategoryWidget extends StatelessWidget {
  final Function() generalAdverts;
  const WebCategoryWidget({
    super.key,
    required this.size, required this.generalAdverts,
  });

  final Size size;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: size.height * 0.9,
        width: size.width * 0.25,
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            WebCarType(
              image: 'assets/images/car.png',
              title: 'Otomobil',
              number: '91.234',
              onTap: generalAdverts,
            ),
            WebCarType(
              image: 'assets/images/suv.png',
              title: 'Arazi, SUV, Pick-up',
              number: '12.123', 
              onTap:generalAdverts,
            ),
            WebCarType(
              image: 'assets/images/motorcycle.png',
              title: 'Motosiklet',
              number: '2.343',
               onTap:generalAdverts,
            ),
            WebCarType(
              image: 'assets/images/pickup.png',
              title: 'Ticari Araçlar',
              number: '1.234',
               onTap: generalAdverts,
            ),
            WebCarType(
              image: 'assets/images/broken-car.png',
              title: 'Hasarlı Araçlar',
              number: '9.254',
               onTap: generalAdverts,
            ),
          ],
        ),
      ),
    );
  }
}