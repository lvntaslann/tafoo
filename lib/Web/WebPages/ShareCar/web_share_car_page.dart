import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/share_car_provider.dart';
import 'package:tafoo/web/webpages/sharecar/web_add_image_page.dart';
import 'package:tafoo/widgets/web/sharecar/web_share_car_button.dart';
import 'package:tafoo/widgets/web/sharecar/web_share_car_text_widget.dart';
import 'package:tafoo/widgets/web/sharecar/web_share_car_title.dart';
import 'package:tafoo/widgets/web/sharecar/web_textfield.dart';

class WebShareCarPage extends StatefulWidget {
  const WebShareCarPage({Key? key}) : super(key: key);

  @override
  _WebShareCarPageState createState() => _WebShareCarPageState();
}

class _WebShareCarPageState extends State<WebShareCarPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carSerialController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController gearController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController kilometerConroller = TextEditingController();
  TextEditingController costController = TextEditingController();
  bool isTrue = true;
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    carModelController.dispose();
    carSerialController.dispose();
    yearController.dispose();
    gearController.dispose();
    fuelController.dispose();
    carTypeController.dispose();
    kilometerConroller.dispose();
    costController.dispose();
    super.dispose();
  }

  void onTap() async {
    await onTapFirstData();
    setState(() {
      isTrue = !isTrue;
    });
  }

  void saveData() async {
    await onTapSecondData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WebAddImagePage()));
  }

  Future<void> onTapSecondData() async {
    final carShareProvider =
        Provider.of<CarShareProvider>(context, listen: false);

    try {
      carShareProvider.carSecondData(
        yearController.text,
        gearController.text,
        fuelController.text,
        carTypeController.text,
        kilometerConroller.text,
        costController.text,
      );

      print('Car data saved successfully');
    } catch (e) {
      print('Failed to save car data: $e');
    }
  }

  Future<void> onTapFirstData() async {
    final carShareProvider =
        Provider.of<CarShareProvider>(context, listen: false);

    try {
      carShareProvider.carFirstData(
          titleController.text,
          descriptionController.text,
          locationController.text,
          phoneNumberController.text,
          carModelController.text,
          carSerialController.text);
      print('First page car data saved successfully');
    } catch (e) {
      print('Failed to save first page car data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isTrue)
              Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: size.height,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0XFFFE7F21),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WebMyShareCarTextWidget(),
                            SizedBox(height: 30),
                            WebShareCarTitle(
                              text: "İlan Başlığı",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "Aion S 2024 Model",
                              controller: titleController,
                            ),
                            SizedBox(height: 10),
                            WebShareCarTitle(
                              text: "Açıklama",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "Hatasız, boyasız, temiz",
                              controller: descriptionController,
                            ),
                            SizedBox(height: 10),
                            WebShareCarTitle(
                              text: "Konum",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "Edirne, Merkez",
                              controller: locationController,
                            ),
                            SizedBox(height: 10),
                            WebShareCarTitle(
                              text: "Telefon",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "05537743726",
                              controller: phoneNumberController,
                            ),
                            SizedBox(height: 10),
                            WebShareCarTitle(
                              text: "Marka/model",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "BWM",
                              controller: carModelController,
                            ),
                            SizedBox(height: 10),
                            WebShareCarTitle(
                              text: "Seri",
                            ),
                            SizedBox(height: 10),
                            WebTextField(
                              text: "İ3",
                              controller: carSerialController,
                            ),
                            SizedBox(height: 20),
                            WebShareCarButton(onTap: onTap),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                  Positioned(
                    top: 265,
                    left: 750,
                    child: LottieBuilder.network(
                      "https://lottie.host/51303012-03a2-49df-b27e-6043042ccbba/rmtTxV7G5i.json",
                      width: 700,
                      height: 700,
                    ),
                  ),
                ],
              ),
            if (!isTrue)
              Stack(
                children: [
                  Positioned(
                    top: 265,
                    left: 100,
                    child: LottieBuilder.network(
                      "https://lottie.host/51303012-03a2-49df-b27e-6043042ccbba/rmtTxV7G5i.json",
                      width: 700,
                      height: 700,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 921.4),
                        child: Container(
                          height: size.height,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Color(0XFFFE7F21),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80),
                                bottomLeft: Radius.circular(80)),
                          ),
                          child: Column(
                            children: [
                              WebMyShareCarTextWidget(),
                              SizedBox(height: 20),
                              WebShareCarTitle(
                                text: "Yıl",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "2016",
                                controller: yearController,
                              ),
                              SizedBox(height: 7),
                              WebShareCarTitle(
                                text: "Vites tipi",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "Otomatik",
                                controller: gearController,
                              ),
                              SizedBox(height: 7),
                              WebShareCarTitle(
                                text: "Yakıt tipi",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "Dizel",
                                controller: fuelController,
                              ),
                              SizedBox(height: 7),
                              WebShareCarTitle(
                                text: "Kasa tipi",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "Sedan",
                                controller: carTypeController,
                              ),
                              SizedBox(height: 7),
                              WebShareCarTitle(
                                text: "Kilometre",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "100000",
                                controller: kilometerConroller,
                              ),
                              SizedBox(height: 7),
                              WebShareCarTitle(
                                text: "Aracınızın fiyatı",
                              ),
                              SizedBox(height: 7),
                              WebTextField(
                                text: "100000",
                                controller: costController,
                              ),
                              SizedBox(height: 15),
                              WebShareCarButton(
                                onTap: saveData,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
