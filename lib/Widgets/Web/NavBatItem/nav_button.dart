import 'package:flutter/material.dart';

class WebNavButton extends StatelessWidget {
  const WebNavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextButton(onPressed: () {}, child: Text("Anasayfa")),
    );
  }
}

class MyWebSearchBar extends StatelessWidget {
  const MyWebSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, top: 30),
      child: Container(
        width: 953, // Burada genişliği istediğin kadar ayarlayabilirsin
        height: 80,
        child: TextFormField(
          style: TextStyle(
            color: const Color.fromARGB(255, 110, 109, 109).withOpacity(0.9),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(164, 164, 164, 1.0),
            ),
            labelText: "Marka, Model veya anahtar kelime",
            labelStyle: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Color(0xFFE8E6E6), // Arka plan rengini değiştirdim
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}