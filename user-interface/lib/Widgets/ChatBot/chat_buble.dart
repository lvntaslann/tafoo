import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatBuble extends StatelessWidget {
  final String? message;
  final bool isUserInput;
  final bool isLoading;
  final bool isWeb;
  const ChatBuble({
    super.key,
    required this.isUserInput,
    this.message,
    required this.isLoading, required this.isWeb,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double maxWidth = size.width * 0.65;
    double textWidth = 0.0;


    EdgeInsets paddingUser = isWeb
        ? const EdgeInsets.only(right: 150) // Web'de daha fazla padding
        : const EdgeInsets.only(right: 5); // Mobilde normal padding
    EdgeInsets paddingLottie = isWeb
        ? const EdgeInsets.only(left: 150)
        : const EdgeInsets.only(left: 5);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: message ?? "",
        style: TextStyle(fontSize: 15, color: isUserInput ? Colors.black : Colors.white),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();

    textWidth = textPainter.size.width;
    double finalWidth = textWidth > maxWidth ? maxWidth : textWidth;

    return Row(
      mainAxisAlignment:
          isUserInput ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isUserInput)
          Padding(
            padding: paddingLottie,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  "assets/images/lottie.json",
                  width: 70,
                  height: 70,
                  repeat: false,
                ),
                if (isLoading)
                  Lottie.asset(
                    "assets/images/loading.json",
                    width: 120,
                    height: 120,
                  ),
              ],
            ),
          ),
        if (isUserInput || !isLoading)
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 30),
              child: Container(
                width: finalWidth,
                decoration: BoxDecoration(
                  color: isUserInput ? Colors.white : Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  message ?? "",
                  style: TextStyle(
                      color: isUserInput ? Colors.black : Colors.white,
                      fontSize: 15),
                ),
              ),
            ),
          ),
        if (isUserInput)
          Padding(
            padding:paddingUser,
            child: Image.asset(
              "assets/images/man.png",
              width: 40,
              height: 40,
            ),
          ),
      ],
    );
  }
}
