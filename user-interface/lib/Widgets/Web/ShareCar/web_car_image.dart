import 'package:flutter/material.dart';

class WebCarImage extends StatelessWidget {
  const WebCarImage({
    super.key,
    required this.size,
    required this.url,
    this.tag,
  });

  final Size size;
  final String url;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 300, top: 50),
      child: Hero(
        tag: tag ?? "",
        child: Container(
          height: size.height * 0.6,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFD9D9D9),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
