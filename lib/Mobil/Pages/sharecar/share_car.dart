import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Provider/share_car_provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_second_page.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/Widgets/Mobil/button/my_next_button.dart';
import 'package:tafoo/Widgets/Mobil/text/my_text_widget.dart';
import 'package:tafoo/Widgets/Mobil/textfield/share_car_textfield.dart';
import 'package:tafoo/Widgets/Mobil/text/title_text_widget.dart';

class ShareCar extends StatefulWidget {
  const ShareCar({Key? key}) : super(key: key);

  @override
  State<ShareCar> createState() => _ShareCarState();
}

class _ShareCarState extends State<ShareCar> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController carModelController = TextEditingController();
  TextEditingController carSerialController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    phoneNumberController.dispose();
    carModelController.dispose();
    carSerialController.dispose();
    super.dispose();
  }

  void nextPage() async {
    await onTapFirstData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ShareCarSecondPage()));
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: AppBackButton()),
            MyTextWidget(),
            SizedBox(height: 35),
            TitleTextWidget(
              text: "İlan Başlığı",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "Aion S 2024 Model",
              controller: titleController,
            ),
            SizedBox(height: 7),
            TitleTextWidget(
              text: "Açıklama",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "Hatasız,boyasız,temiz",
              controller: descriptionController,
            ),
            SizedBox(height: 7),
            TitleTextWidget(
              text: "Konum",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "Edirne,Merkez",
              controller: locationController,
            ),
            SizedBox(height: 7),
            TitleTextWidget(
              text: "Telefon",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "05537743726",
              controller: phoneNumberController,
            ),
            SizedBox(height: 7),
            TitleTextWidget(
              text: "Marka/Model",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "BWM",
              controller: carModelController,
            ),
            SizedBox(height: 7),
            TitleTextWidget(
              text: "Seri",
            ),
            SizedBox(height: 3),
            ShareCarTextField(
              text: "I3",
              controller: carSerialController,
            ),
            SizedBox(height: 10),
            MyNextButton(onTap: nextPage),
          ],
        ),
      ),
    );
  }
}
