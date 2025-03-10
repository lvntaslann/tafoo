import 'package:flutter/material.dart';

class WebDownloadApp extends StatelessWidget {
  const WebDownloadApp({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0XFF222027),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Image.asset("assets/images/tafoologo.png",width: 184,height: 221,),
          ),
          SizedBox(width: 10),
          Text("Şimdi tüm platformlarda !",style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
          SizedBox(width: 300),
          Image.asset("assets/images/play_store-DbkwCeg2.png",width: 250,height: 85),
          Image.asset("assets/images/app_store-BqgDInZP.png",width: 250,height: 85)
        ],
      ),
    );
  }
}