import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/GeneralAdverts/automobile_cardamage_result.dart';
import 'package:tafoo/Mobil/Pages/sharecar/shared_car_details.dart';
import 'package:tafoo/Provider/chat_services_provider.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/Widgets/Mobil/button/my_button.dart';
import 'package:tafoo/Widgets/car_image.dart';
import 'package:tafoo/Widgets/car_share_title.dart';
import 'package:tafoo/Widgets/cost_value.dart';
import 'package:tafoo/Widgets/go_ai_details.dart';
import 'package:tafoo/Widgets/go_profil_page.dart';
import 'package:tafoo/Widgets/shared_car_location.dart';
import 'package:tafoo/Widgets/shared_detail.dart';

class AutomobilCarDetails extends StatefulWidget {
  final Map<String, dynamic> carData;
  final String tag;
  const AutomobilCarDetails(
      {Key? key, required this.carData, required this.tag})
      : super(key: key);

  @override
  _AutomobilCarDetailsState createState() => _AutomobilCarDetailsState();
}

class _AutomobilCarDetailsState extends State<AutomobilCarDetails> {
  bool _isLoading = false;
  void goAiResult() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AutomobileCardamageResult(
          url: widget.carData['svgFile'],
          image: widget.carData['imageFile'],

        ),
      ),
    );
  }

  void onTap() async {
  setState(() {
    _isLoading = true;
  });
    
  final chatProvider = Provider.of<ChatServicesProvider>(context, listen: false);

  Map<String, dynamic> carDetails = {
    "Başlık": widget.carData['adTitle'] ?? "Bilinmeyen Araç",
    "Marka": widget.carData['model'] ?? "Bilinmeyen",
    "Seri": widget.carData['serial'] ?? "Bilinmeyen",
    "Yıl": widget.carData['year'] ?? "Bilinmeyen",
    "Vites Tipi": widget.carData['gearType'] ?? "Bilinmeyen",
    "Yakıt Tipi": widget.carData['fuel'] ?? "Bilinmeyen",
    "Kasa Tipi": widget.carData['carType'] ?? "Bilinmeyen",
    "Kilometre": widget.carData['kilometre'] ?? "Bilinmeyen",
    "Fiyat": widget.carData['carCost'] ?? "Bilinmeyen"
  };

  chatProvider.addAdvertsInstruct(carDetails);

  await chatProvider.sendAdvertsDetails();

  String aiResponse = chatProvider.messages.isNotEmpty
      ? chatProvider.messages.last['message']
      : "AI'den yanıt alınamadı.";
  
    setState(() {
    _isLoading = false;
  });

  showAiResultDialog(aiResponse);
}

void showAiResultDialog(String aiResponse) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          "İlan özeti",
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange),
        ),
        content: SingleChildScrollView(
          child: Text(
            aiResponse,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Kapat"),
          ),
        ],
      );
    },
  );
}



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Row(
              children: [
                const AppBackButton(),
                const Padding(
                  padding: EdgeInsets.only(top: 40, left: 50),
                  child: Text(
                    "İlan önizlemesi",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF5E5D5D),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: _isLoading
      ? SizedBox(
          width: MediaQuery.of(context).size.width * 0.08,
          height: MediaQuery.of(context).size.width * 0.08,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange), // Renk
          ),
        )
      : MyButton(
          onTap: onTap,
          text: "özetle",
          isInstructButton: true,
        ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          CarImage(
            tag: widget.tag,
            url: widget.carData['image']?[0] ?? "firebasedeki resim",
          ),
          const SizedBox(height: 5),
          CarShareTitle(
            title: widget.carData['adTitle'] ?? "Sahibinden hasarsız araba",
          ),
          const SizedBox(height: 10),
          Location(location: widget.carData['location'] ?? "Belirtilmemiş"),
          CostValue(cost: widget.carData['carCost'] ?? "1.500.000TL"),
          const SizedBox(height: 10),
          GoAiResult(onTap: goAiResult),
          const SizedBox(height: 10),
          const GoProfilPage(),
          const SizedBox(height: 10),
          ChooseContainer(size: size),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShareDetail(
                    title: "Marka",
                    result: widget.carData['model'] ?? "Bmw",
                  ),
                  ShareDetail(
                    title: "Seri",
                    result: widget.carData['serial'] ?? "İ3",
                  ),
                  ShareDetail(
                    title: "Yıl",
                    result: widget.carData['year'] ?? "2021",
                  ),
                  ShareDetail(
                    title: "Vites tipi",
                    result: widget.carData['gearType'] ?? "Otomatik",
                  ),
                  ShareDetail(
                    title: "Yakıt tipi",
                    result: widget.carData['fuel'] ?? "Dizel",
                  ),
                  ShareDetail(
                    title: "Kasa tipi",
                    result: widget.carData['carType'] ?? "Sedan",
                  ),
                  ShareDetail(
                    title: "Kilometre",
                    result: widget.carData['kilometre'] ?? "100000Km",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
