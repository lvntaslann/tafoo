import 'package:flutter/material.dart';
import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Provider/car_damage_provider.dart';
import 'package:tafoo/Provider/share_car_provider.dart';
import 'package:tafoo/Web/WebPages/ShareCar/web_car_share_detail.dart';

class WebAiWaitingPage extends StatefulWidget {
  const WebAiWaitingPage({ Key? key }) : super(key: key);

  @override
  _WebAiWaitingPageState createState() => _WebAiWaitingPageState();
}

class _WebAiWaitingPageState extends State<WebAiWaitingPage> {
   late final CarDamageProvider carDamageProvider;

  @override
  void initState() {
    super.initState();
    carDamageProvider = Provider.of<CarDamageProvider>(context, listen: false);


    carDamageProvider.addListener(_onCarDamageProcessed);
  }

  void _onCarDamageProcessed() async {
    if (!mounted) return;
    await Future.delayed(Duration(seconds: 1)); // 1 saniyelik gecikme
    if (carDamageProvider.processedImage != null && carDamageProvider.detections != null) {
      Provider.of<CarShareProvider>(context,listen: false).resetSvgUploadStatus();
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WebCarShareDetail(
            imageBytes: carDamageProvider.processedImage,
            detections: carDamageProvider.detections,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    carDamageProvider.removeListener(_onCarDamageProcessed);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: LottieBuilder.network(
              "https://lottie.host/cfe88cf7-5012-4cb8-8645-20a685316583/r7SHWmwKPR.json",
              width: 290,
              height: 265,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: CircularProgressInd().normalCircular(
                height: 55,
                width: 55,
                isSpining: true,
                secondaryColor: Colors.deepPurple[900],
                secondaryWidth: 10,
                backgroundColor: Colors.amber,
                padding: EdgeInsets.all(10),
                backgroundBorder:
                    Border.all(color: Colors.deepPurple, width: 3),
                valueWidth: 6),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 50),
            child: Text(
              "Yapay zeka tarafından test ediliyor...",
              style: TextStyle(
                  color: Color(0XFF898989),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}