import 'package:flutter/material.dart';
import 'package:tafoo/Pages/car_search_page.dart';
import 'package:tafoo/Pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarSearchPage(),
    );
  }
}
