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
  List<String> _imageUrls = [];
  String? _svgFile;
  List<Map<String, dynamic>> carDataList = [];
  List<Map<String, dynamic>> carDataListById = [];

  String newdDocumentId = "";
  String newGeneralAdvertId = "";
  bool isSvgUploaded = false;

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

  void addSvgFile(String svgUrl) async {
    _svgFile = svgUrl;

    try {
      CollectionReference adverts = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('advert');
      await adverts.doc(newdDocumentId).update({
        'svgFile': _svgFile,
      });

      CollectionReference generalAdverts = FirebaseFirestore.instance
          .collection('generalAdverts')
          .doc("FYsPCD1od0RlTxznamV0")
          .collection('autoMobile');
      await generalAdverts.doc(newGeneralAdvertId).update({
        'svgFile': _svgFile,
      });
    } catch (e) {
      print('Failed to update SVG file: $e');
    }
    resettrue();
    notifyListeners();
  }

  void resettrue() {
    isSvgUploaded = true;
    notifyListeners();
  }

  void resetSvgUploadStatus() {
    isSvgUploaded = false;
    notifyListeners();
  }

  Future<void> saveCarData(bool isCameraImage) async {
    try {
      CollectionReference adverts = FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .collection('advert');

      CollectionReference generalAdverts = FirebaseFirestore.instance
          .collection('generalAdverts')
          .doc("FYsPCD1od0RlTxznamV0")
          .collection('autoMobile');

      DocumentReference docRef = await adverts.add({
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
        'date': isCameraImage ? Timestamp.now() : null,
      });

      DocumentReference docRefGeneral = await generalAdverts.add({
        'userId': currentUser?.uid,
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
        'date': isCameraImage ? Timestamp.now() : null,
      });

      newdDocumentId = docRef.id;
      newGeneralAdvertId = docRefGeneral.id;
      print('Car data saved successfully. Document ID: $newdDocumentId');
    } catch (e) {
      print('Failed to save car data: $e');
    }
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getCarData() async {
  try {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser?.uid)
        .collection("advert")
        .get();

    List<Map<String, dynamic>> carDataList = snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    notifyListeners();
    return carDataList;
  } catch (e) {
    print('Error loading car data: $e');
    return [];
  }
}


  Future<List<Map<String, dynamic>>> getGeneralAdvertsData() async {
    List<Map<String, dynamic>> allCarData = [];

    try {
      // Burada 'autoMobile' koleksiyonundaki tüm dökümanları alıyoruz.
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("generalAdverts")
          .doc("FYsPCD1od0RlTxznamV0")
          .collection("autoMobile")
          .get(); // get() ile tüm verileri çekiyoruz.

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          allCarData.add(doc.data() as Map<String, dynamic>);
        }
        print('Retrieved ${allCarData.length} car ads');
      } else {
        print('No documents found.');
      }

      return allCarData;
    } catch (e) {
      print('Error loading car data: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getCarDataById() async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser?.uid)
          .collection("advert")
          .doc(newdDocumentId)
          .get();

      if (docSnapshot.exists) {
        Map<String, dynamic> carData =
            docSnapshot.data() as Map<String, dynamic>;
        print(carData);
        return carData;
      } else {
        print('No document found with the given ID.');
        return null;
      }
    } catch (e) {
      print('Error loading car data by ID: $e');
      return null;
    }
  }
}
