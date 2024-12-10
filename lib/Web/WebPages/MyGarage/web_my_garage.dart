import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Provider/share_car_provider.dart';
import 'package:tafoo/Web/WebPages/MyGarage/web_my_garage_detail.dart';
import 'package:tafoo/Widgets/Web/NavBatItem/web_navbar.dart';

class WebMyGarage extends StatefulWidget {
  const WebMyGarage({ Key? key }) : super(key: key);

  @override
  _WebMyGarageState createState() => _WebMyGarageState();
}

class _WebMyGarageState extends State<WebMyGarage> {
   List<Map<String, dynamic>> carDetails = [];
   bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    List<Map<String, dynamic>> fetchedData =
        await Provider.of<CarShareProvider>(context, listen: false)
            .getCarData();

    if (fetchedData.isNotEmpty) {
      setState(() {
        isLoading = false;
        carDetails = fetchedData;
      });
    } else {
      print('No car data found');
      isLoading = false;
    }
  }
    @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (isLoading) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (carDetails.isEmpty) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
        body: const Center(
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
        children: [
          WebNavBar(size: size),

          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: carDetails.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>WebMyGarageDetail(carData: carDetails[index], tag: "car_$index")));
                          },
                          child: Row(
                            children: [
                              Hero(
                                tag: "car_$index",
                                child: carDetails[index]['image'] is List &&
                                        (carDetails[index]['image'] as List)
                                            .isNotEmpty
                                    ? Image.network(
                                        (carDetails[index]['image'] as List)[0],
                                        width: 120,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/images/default_image.png',
                                        width: 120,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              const SizedBox(width: 20),
                          
                                    Text(
                                      carDetails[index]['adTitle'] ??
                                          "İlan Başlığı",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      carDetails[index]['description'] ??
                                          "Açıklama bilgisi yok.",
                                      style: const TextStyle(
                                        color: Color(0xFF898989),
                                        fontSize: 14,
                                      ),
                                    ),
                          
                              const SizedBox(width: 20),
                          
                              Text(
                                carDetails[index]['location'] ?? "Konum bilgisi",
                                style: const TextStyle(
                                  color: Color(0xFF5E5D5D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                carDetails[index]['carCost']  ?? "Fiyat bilgisi",
                                style: const TextStyle(
                                  color: Color(0xFFFE7F21),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(width: 20),
                          
                          
                              Text(
                                carDetails[index]['carType'] ?? "Konum bilgisi",
                                style: const TextStyle(
                                  color: Color(0xFF5E5D5D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                          
                              Text(
                                carDetails[index]['gearType'] ?? "Konum bilgisi",
                                style: const TextStyle(
                                  color: Color(0xFF5E5D5D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 20),
                          
                              Text(
                                carDetails[index]['kilometre'] ?? "Konum bilgisi",
                                style: const TextStyle(
                                  color: Color(0xFF5E5D5D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}