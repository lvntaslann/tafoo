import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/Web/Category/web_category_widget.dart';
import 'package:tafoo/Widgets/Web/DownloadApp/web_download_app.dart';
import 'package:tafoo/Widgets/Web/NavBatItem/nav_button.dart';
import 'package:tafoo/Widgets/Web/NavBatItem/web_navbar.dart';
import 'package:tafoo/Widgets/Web/WebRoute/web_router_container.dart';
import 'package:tafoo/Widgets/Web/car_discover.dart';
import 'package:tafoo/Widgets/Web/example_image.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({Key? key}) : super(key: key);

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebNavBar(size: size),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0XFFFAFAFA),
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/tafoologo.png",
                    width: 180,
                    height: 130,
                  ),
                  Text(
                    "hep yanında !",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFE7F21)),
                  ),
                  MyWebSearchBar(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Sol bölüm (CarType listesi)
                WebCategoryWidget(size: size),

                // Sağ bölüm (Resim ve ilan seçenekleri)
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Üstteki geniş resim
                      ExampleImage(),
                      // Alt seçenekler kısmı
                      RouterContainer(),
                    ],
                  ),
                ),
              ],
            ),
            CarDiscover(size: size),
            SizedBox(height: 100),
            WebDownloadApp(size: size),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}





















