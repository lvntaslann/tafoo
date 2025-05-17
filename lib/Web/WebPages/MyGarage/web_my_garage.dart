import 'package:data_table_2/data_table_2.dart';
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: DataTable2(
                columnSpacing: 8,
                horizontalMargin: 8,
                minWidth: 800,
                dataRowHeight: 120,
                columns: const [
                  DataColumn(label: Text('Resim')),
                  DataColumn(label: Text('İlan Başlığı')),
                  DataColumn(label: Text('Açıklama')),
                  DataColumn(label: Text('Konum')),
                  DataColumn(label: Text('Fiyat')),
                  DataColumn(label: Text('Araç Tipi')),
                  DataColumn(label: Text('Vites Tipi')),
                  DataColumn(label: Text('Kilometre')),
                ],
                rows: List.generate(carDetails.length, (index) {
                  final car = carDetails[index];
                  final image = car['image'];
                  String? imageUrl;

                  if (image is List && image.isNotEmpty) {
                    imageUrl = image[0];
                  } else if (image is String) {
                    imageUrl = image;
                  } else {
                    imageUrl = null; // Varsayılan resim için null
                  }

                  return DataRow(
                    cells: [
                      DataCell(
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebMyGarageDetail(
                                  carData: car,
                                  tag: "car_$index",
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "car_image_$index",
                            child: imageUrl != null
                                ? Image.network(
                                    imageUrl,
                                    width: 200,
                                    height: 95,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/default_image.png',
                                    width: 100,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      DataCell(
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebMyGarageDetail(
                                  carData: car,
                                  tag: "car_title_$index",
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "car_title_$index",
                            child: Text(
                              car['adTitle'] ?? "İlan Başlığı",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      DataCell(Text(car['description'] ?? "Açıklama bilgisi yok.")),
                      DataCell(Text(car['location'] ?? "Konum bilgisi")),
                      DataCell(Text(car['carCost'] ?? "Fiyat bilgisi",style: TextStyle(color: Color(0XFFFE7F21)),)),
                      DataCell(Text(car['carType'] ?? "Araç Tipi yok")),
                      DataCell(Text(car['gearType'] ?? "Vites Tipi yok")),
                      DataCell(Text(car['kilometre'] ?? "Kilometre bilgisi yok")),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}