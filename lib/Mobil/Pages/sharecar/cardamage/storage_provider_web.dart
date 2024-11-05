import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class StorageProviderWeb with ChangeNotifier {
  final firebaseStorage = FirebaseStorage.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  List<String> _imageUrls = [];
  bool _isLoading = false;
  bool _isUploading = false;

  List<String> get imageUrls => _imageUrls;
  bool get isLoading => _isLoading;
  bool get isUploading => _isUploading;

  Future<void> fetchImages() async {
    _isLoading = true;
    notifyListeners();

    try {
      final ListResult result = await firebaseStorage.ref('uploaded_images/').listAll();
      final urls = await Future.wait(result.items.map((ref) => ref.getDownloadURL()));
      _imageUrls = urls;
    } catch (e) {
      print("Error fetching images: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    try {
      _imageUrls.remove(imageUrl);
      final String path = extractPathFromUrl(imageUrl);
      await firebaseStorage.ref(path).delete();
      notifyListeners();
    } catch (e) {
      print("Error deleting image: $e");
    }
  }

  String extractPathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    return uri.path.substring(1); // URL'den path kısmını alır
  }

  Future<String?> uploadImage() async {
    _isUploading = true;
    notifyListeners();

    try {
      final Uint8List? imageBytes = await pickImage();

      if (imageBytes == null) return null;

      String mimeType = await getMimeType(imageBytes);
      String fileExtension = mimeType.split('/').last;

      String filePath = 'uploaded_images/${currentUser!.uid}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';

      await firebaseStorage.ref(filePath).putData(imageBytes);
      String downloadUrl = await firebaseStorage.ref(filePath).getDownloadURL();

      _imageUrls.add(downloadUrl);
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }

  Future<Uint8List?> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.first.bytes;
    }
    return null;
  }

  Future<String> getMimeType(Uint8List bytes) async {
    final byteString = bytes.sublist(0, 4);
    String mime = 'image/png';

    if (byteString[0] == 0xFF && byteString[1] == 0xD8) {
      mime = 'image/jpeg';
    } else if (byteString[0] == 0x89 && byteString[1] == 0x50) {
      mime = 'image/png';
    } else if (byteString[0] == 0x47 && byteString[1] == 0x49) {
      mime = 'image/gif';
    } else if (byteString[0] == 0x49 && byteString[1] == 0x20) {
      mime = 'image/tiff';
    }

    return mime;
  }
}
