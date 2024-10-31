import 'package:flutter/material.dart';

class WebGoProfilPage extends StatelessWidget {
  const WebGoProfilPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300),
      child: Row(
        children: [
          Image.asset(
            "assets/images/man.png",
            width: 40,
            height: 40,
          ),
          SizedBox(width: 5),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "LEVENT A.",
                    style: TextStyle(
                        color: Color(0XFF898989),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0XFFD9D9D9),
                    ),
                    child: Center(
                        child: Text(
                      "1.YIL",
                      style: TextStyle(
                          color: Color(0XFF898989),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 55),
                child: Text(
                  "Bireysel Üye",
                  style: TextStyle(
                      color: Color(0XFFBFBEBE),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}