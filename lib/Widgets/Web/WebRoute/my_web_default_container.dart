import 'package:flutter/material.dart';

class MyWebDefaultContainer extends StatelessWidget {
  final String text;
  final String description;
  final String? image;
  final double height;
  final double width;
  final bool isNumber;
  final bool isAiOto;
  final Function()? onTap;
  final Function()? aiTest;
  const MyWebDefaultContainer({
    super.key,
    required this.text,
    required this.description,
    this.image,
    required this.height,
    required this.width,
    required this.isNumber,
    required this.isAiOto,
    this.onTap, this.aiTest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null && image!.isNotEmpty && isAiOto == true)
                Center(
                  child: Image.asset(
                    image!,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(254, 127, 33, 1.0),
                    fontSize: isAiOto ? 15 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isAiOto == false)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(description,
                      style: TextStyle(
                          color: Color.fromRGBO(164, 164, 164, 1.0),
                          fontSize: 17)),
                ),
              if (isAiOto)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(description,
                          style: TextStyle(
                              color: Color.fromRGBO(164, 164, 164, 1.0))),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: aiTest,
                        icon: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 30,
                        ))
                  ],
                ),
              Row(
                children: [
                  if (isNumber)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("120.552 ilan",
                          style: TextStyle(
                              color: Color.fromRGBO(94, 93, 93, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  if (isNumber == false)
                    SizedBox(
                      width: 80,
                    ),
                  if (image != null && image!.isNotEmpty && isAiOto == false)
                    Expanded(
                        child: Image.asset(
                      image!,
                      height: 45,
                    )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}