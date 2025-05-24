import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/pages/mobil/pages/GeneralAdverts/automobil_car_details.dart';
import 'package:tafoo/services/share_car_provider.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';

class AutomobileAdverts extends StatefulWidget {
  const AutomobileAdverts({Key? key}) : super(key: key);

  @override
  _AutomobileAdvetsState createState() => _AutomobileAdvetsState();
}

class _AutomobileAdvetsState extends State<AutomobileAdverts> {
  List<Map<String, dynamic>> carDetails = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> fetchedData =
          await Provider.of<CarShareProvider>(context, listen: false)
              .getGeneralAdvertsData();

      setState(() {
       
        isLoading = false;
         carDetails = fetchedData;
      });
    } catch (e) {
      print('Hata: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (isLoading) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (carDetails.isEmpty) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
        body: Center(
          child: Text(
            "Henüz araç ilanı yok",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          AppBackButton(),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                height: size.height * 0.8,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: EdgeInsets.all(10),
                  children: List.generate(
                    carDetails.length,
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AutomobilCarDetails(
                              carData: carDetails[index],
                              tag: "car_$index",
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0XFFE9E9E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: "car_$index",
                              child: carDetails[index]['image'] is List &&
                                      (carDetails[index]['image'] as List)
                                          .isNotEmpty
                                  ? Image.network(
                                      (carDetails[index]['image'] as List)[0],
                                      width: 200,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/images/default_image.png',
                                      width: 170,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carDetails[index]['location'] ?? "Location",
                                    style: TextStyle(
                                      color: Color(0XFF5E5D5D),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    carDetails[index]['description'] ??
                                        "Description",
                                    style: TextStyle(
                                      color: Color(0XFF898989),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80),
                                    child: Text(
                                      carDetails[index]['carCost'] ?? "Cost",
                                      style: TextStyle(
                                        color: Color(0XFFFE7F21),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
