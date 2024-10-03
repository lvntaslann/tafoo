import 'package:flutter/material.dart';

class LoginLogoContainer extends StatelessWidget {
  final String title1;
  final String title2;
  final bool isSignUp;

  const LoginLogoContainer({
    super.key,
    required this.size,
    required this.title1,
    required this.title2,
    required this.isSignUp,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    // Ekranın yönünü kontrol et
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      height: isPortrait ? size.height * 0.37 : size.height * 0.8,
      width: size.width,
      decoration: BoxDecoration(
        color: Color(0XFFFE7F21),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  // Ekran yönüne göre mainAxisAlignment ayarlama
                  mainAxisAlignment: isPortrait ? MainAxisAlignment.start : MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/tafoologo.png",
                      width: 190,
                      height: 145,
                    ),
                    Text(
                      title1,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                title2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isSignUp)
                Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: Hero(
                    tag: "tag",
                    child: Image.asset(
                      "assets/images/broken-car.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              if (isSignUp)
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: Hero(
                    tag: "tag",
                    child: Image.asset(
                      "assets/images/broken-car.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
