import 'package:flutter/material.dart';

class HomePageContainer extends StatelessWidget {
  const HomePageContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Orange background
        Container(
          height: size.height * 0.30,
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
      ],
    );
  }
}
