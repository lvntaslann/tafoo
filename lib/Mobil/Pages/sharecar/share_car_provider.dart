import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CarShareProvider with ChangeNotifier {
  User? currentUser = FirebaseAuth.instance.currentUser;
  String? adTitle;
  String? description;
  String? location;
  String? phoneNumber;
  String? carModel;
  String? carSerial;
  String? year;
  String? gearType;
  String? fuel;
  String? carType;
  String? kilometre;
  String? carCost;
  List<String> _imageUrls =[];

  void carFirstData(String adTitle, String description, String location,
      String phoneNumber, String carModel, String carSerial) {
    this.adTitle = adTitle;
    this.description = description;
    this.location = location;
    this.phoneNumber = phoneNumber;
    this.carModel = carModel;
    this.carSerial = carSerial;
    notifyListeners();
  }

  void carSecondData(String year, String gear, String fuel, String carType,
      String kilometre, String cost) {
    print(adTitle);
    this.year = year;
    this.gearType = gear;
    this.fuel = fuel;
    this.carType = carType;
    this.kilometre = kilometre;
    this.carCost = cost;
    notifyListeners();
  }

  void addImage(List<String> imageUrls) {
    _imageUrls = imageUrls;
    notifyListeners();
  }

  Future<void> saveCarData(bool isCameraImage) async {
    try {
      CollectionReference adverts = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('advert');

      await adverts.add({
        'adTitle': adTitle,
        'carCost': carCost,
        'carType': carType,
        'description': description,
        'gearType': gearType,
        'fuel': fuel,
        'image': _imageUrls,
        'kilometre': kilometre,
        'location': location,
        'model': carModel,
        'phoneNumber': phoneNumber,
        'serial': carSerial,
        'year': year,
        'date':isCameraImage? Timestamp.now():null,
      });

      print('Car data saved successfully.');
    } catch (e) {
      print('Failed to save car data: $e');
    }
    notifyListeners();
  }
}
