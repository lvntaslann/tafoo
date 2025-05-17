import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tafoo/Widgets/Mobil/button/back_button.dart';

class AutomobileCardamageResult extends StatelessWidget {
  final String url; // SVG dosyasının URL'si
  final String image; // PNG/JPEG görselinin URL'si

  const AutomobileCardamageResult({
    Key? key,
    required this.url,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Geri Dön Butonu
          const AppBackButton(),

          // SVG Görseli
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SvgPicture.network(
                url,
                width: 300,
                height: 300,
                placeholderBuilder: (BuildContext context) => const Center(
                  child: CircularProgressIndicator(),
                ),

              ),
            ),
          ),

          const SizedBox(height: 10),

          // PNG/JPEG Görseli
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Text(
                      "Görsel yüklenemedi",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
