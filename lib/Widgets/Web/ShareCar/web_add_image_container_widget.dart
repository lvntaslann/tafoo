import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_provider.dart';
import 'package:tafoo/Web/WebPages/web_home_page.dart';

class web_add_image_container_widget extends StatefulWidget {
  const web_add_image_container_widget({
    super.key,
  });

  @override
  State<web_add_image_container_widget> createState() => _web_add_image_container_widgetState();
}

class _web_add_image_container_widgetState extends State<web_add_image_container_widget> {
  bool isCameraImage = false;
  void onTap() async {
    setState(() {
      isCameraImage = !isCameraImage;
    });
    final saveData = Provider.of<CarShareProvider>(context, listen: false);
    await saveData.saveCarData(isCameraImage);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebHomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 450),
      child: Container(
        width: 600,
        height: 340,
        decoration: BoxDecoration(
          color: Color(0XFFD9D9D9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            //Image.asset("assets/images/plus.png",width: 100,height: 100,),
            IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 100,
                  color: Color(0XFFFE7F21),
                )),
            SizedBox(height: 10),
            Text(
              "Görsel Ekle",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}