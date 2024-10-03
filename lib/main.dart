import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tafoo/Mobil/Auth/auth_provider.dart';
import 'package:tafoo/base_page.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  print("Firebase başlatıldı.");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CreateAccountProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasePage()
    );
  }
}
