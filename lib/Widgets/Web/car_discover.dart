import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/shared_car_details.dart';
import 'package:tafoo/Provider/share_car_provider.dart';

class CarDiscover extends StatefulWidget {
  const CarDiscover({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  _CarDiscoverState createState() => _CarDiscoverState();
}

class _CarDiscoverState extends State<CarDiscover> {
  int? _hoveredIndex;
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
    return Padding(
      padding: const EdgeInsets.only(left: 60),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Keşfet",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFFE7F21),
                  ),
                ),
                Container(
                  height: widget.size.height * 0.50,
                  width: widget.size.width,
                  decoration: BoxDecoration(
                    color: Color(0XFFFAFAFA),
                  ),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      8,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SharedCarDetails(tag: 'car_$index'),
                            ),
                          );
                        },
                        child: MouseRegion(
                          onEnter: (event) {
                            setState(() {
                              _hoveredIndex =
                                  index;
                            });
                          },
                          onExit: (event) {
                            setState(() {
                              _hoveredIndex = null;
                            });
                          },
                          child: Container(
                            width: (widget.size.width - 100) / 4,
                            height: 210,
                            decoration: BoxDecoration(
                              color: _hoveredIndex == index
                                  ? Colors.orangeAccent
                                      .shade100 
                                  : Color(0XFFffffff),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: _hoveredIndex == index
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: "car_$index",
                                  child: carDetails[index]['image'] is List &&
                                          (carDetails[index]['image'] as List)
                                              .isNotEmpty
                                      ? Center(
                                        child: Image.network(
                                            (carDetails[index]['image']
                                                as List)[0],
                                            width: 200,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                      )
                                      : Center(
                                        child: Image.asset(
                                            'assets/images/default_image.png',
                                            width: 120,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          ),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        carDetails[index]['location'] ??
                                            "Konum bilgisi",
                                        style: const TextStyle(
                                          color: Color(0xFF5E5D5D),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        carDetails[index]['description'] ??
                                            "Açıklama bilgisi yok.",
                                        style: const TextStyle(
                                          color: Color(0xFF898989),
                                          fontSize: 14,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 220),
                                        child: Text(
                                          carDetails[index]['carCost'] ??
                                              "Fiyat bilgisi",
                                          style: const TextStyle(
                                            color: Color(0xFFFE7F21),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
