import 'package:flutter/material.dart';
import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/car_damage_provider.dart';
import 'package:tafoo/Web/WebPages/GeneralCarDamageDetection/web_car_detail_general_damage.dart';

class WebAiWaitingGeneral extends StatelessWidget {
  const WebAiWaitingGeneral({Key? key}) : super(key: key);

  void _onCarDamageProcessed(BuildContext context, CarDamageProvider provider) async {
    await Future.delayed(const Duration(seconds: 2));
    if (provider.processedImage != null && provider.detections != null) {

      print("Sonuç sayfasına gidiliyor...");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebCarDetailGeneralDamage(
            imageBytes: provider.processedImage!,
            detections: provider.detections!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Consumer<CarDamageProvider>(
        builder: (context, provider, _) {
          _onCarDamageProcessed(context, provider);

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50),
                  child: LottieBuilder.network(
                    "https://lottie.host/cfe88cf7-5012-4cb8-8645-20a685316583/r7SHWmwKPR.json",
                    width: 290,
                    height: 265,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: CircularProgressInd().normalCircular(
                    height: 55,
                    width: 55,
                    isSpining: true,
                    secondaryColor: Colors.deepPurple[900],
                    secondaryWidth: 10,
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.all(10),
                    backgroundBorder: Border.all(color: Colors.deepPurple, width: 3),
                    valueWidth: 6,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 200, left: 50),
                child: Text(
                  "Yapay zeka tarafından test ediliyor...",
                  style: TextStyle(
                      color: Color(0XFF898989),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
