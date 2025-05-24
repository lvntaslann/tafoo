import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/pages/mobil/pages/generalCarDamageDetection/add_image_widget_general.dart';
import 'package:tafoo/pages/mobil/pages/generalCarDamageDetection/car_detail_general.dart';
import 'package:tafoo/services/car_damage_provider.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';
import 'package:tafoo/Widgets/Mobil/button/my_button.dart';
import 'package:tafoo/Widgets/Mobil/text/my_third_text_widget.dart';


class AddImageGeneral extends StatefulWidget {
  const AddImageGeneral({ Key? key }) : super(key: key);

  @override
  _AddImageGeneralState createState() => _AddImageGeneralState();
}

class _AddImageGeneralState extends State<AddImageGeneral> {
    late final CarDamageProvider carDamageProvider;
    @override
  void initState() {
    super.initState();
      carDamageProvider = Provider.of<CarDamageProvider>(context, listen: false);
  }
  void onTap() async{
      if(carDamageProvider.detections!=null)
      {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CarDetailGeneral(            imageBytes: carDamageProvider.processedImage,
            detections: carDamageProvider.detections,)));
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: AppBackButton()),
          MyThirdTextWidget(),
          SizedBox(height:30),
          AddImageWidgetGeneral(),
          SizedBox(height: 50),
          MyButton(onTap: onTap,text: "Yapay zeka analizi",isInstructButton: false,),
        ],
      ),

    );
  }
}