import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 350, // Burada genişliği istediğin kadar ayarlayabilirsin
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
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
