import 'package:flutter/material.dart';

class ExampleImage extends StatelessWidget {
  const ExampleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 20), // Daha küçük bir boşluk bırakıldı
      child: Container(
        width: 1150, // Resmin genişliği
        height: 440, // Resmin yüksekliği
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.jpg"), // Resim yolu
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Şimdi Nissan\nX-Trail sizlerle",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Fiyat bilgisi al butonu
                  },
                  child: Text("Fiyat bilgisi al"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Buton rengi
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}