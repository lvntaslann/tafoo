import 'package:flutter/material.dart';

class DefaultContainer extends StatelessWidget {
  final String text;
  final String description;
  final String? image;
  final double height;
  final double width;
  final bool isNumber ;
  final bool isAiOto;
  const DefaultContainer({
    super.key,
    required this.text,
    required this.description,
    this.image,
    required this.height,
    required this.width, required this.isNumber, required this.isAiOto,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25),
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
            if (image != null && image!.isNotEmpty &&isAiOto==true)
                  Center(
                        child: Image.asset(
                      image!,
                      height: 150,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Color.fromRGBO(254, 127, 33, 1.0),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if(isAiOto==false)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(description,
                  style: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0))),
            ),
            if(isAiOto)
            Row(
              children: [
                Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(description,
                  style: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0))),
            ),
            SizedBox(width: 30),
            IconButton(onPressed: (){}, icon: Icon(Icons.arrow_circle_right_outlined,size: 30,))
              ],
            ),
            Row(
              children: [
                if(isNumber)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text("120.552 ilan",
                      style: TextStyle(color: Color.fromRGBO(94, 93, 93, 1.0),fontWeight: FontWeight.bold,fontSize: 14)),
                ),
                if(isNumber==false)
                SizedBox(width: 80,),
                if (image != null && image!.isNotEmpty &&isAiOto==false)
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
    );
  }
}
