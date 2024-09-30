import 'package:flutter/material.dart';
import 'package:tafoo/Pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tafoo/WebPages/web_home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  print("Firebase başlatıldı.");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebHomePage()
    );
  }
}
