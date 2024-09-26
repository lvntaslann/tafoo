import 'package:flutter/material.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Container(
        width: 330,
        height: 250,
        decoration: BoxDecoration(
          color: Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/plus.png",width: 50,height: 50,),
            Text("Görsel Ekle",style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.bold ),)
          ],
        ),
      ),
    );
  }
}