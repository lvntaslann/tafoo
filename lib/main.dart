import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tafoo/Mobil/Auth/auth_provider.dart';
import 'package:tafoo/Mobil/Auth/google_sign_in_provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/car_damage_provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/storage_provider.dart';
import 'package:tafoo/Mobil/Pages/sharecar/cardamage/storage_provider_web.dart';
import 'package:tafoo/Mobil/Pages/sharecar/share_car_provider.dart';
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
        ChangeNotifierProvider(create:(context) => CarShareProvider(),),
        ChangeNotifierProvider(create: (context)=>StorageProvider()),
        ChangeNotifierProvider(create: (context)=>CarDamageProvider()),
        ChangeNotifierProvider(create: (context)=>GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context)=>StorageProviderWeb()),
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
