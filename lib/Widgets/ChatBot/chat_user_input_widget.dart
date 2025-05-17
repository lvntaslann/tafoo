import 'package:flutter/material.dart';
import 'package:tafoo/Widgets/rounded_border_with_icon.dart';

class ChatUserInputWidget extends StatelessWidget {
  const ChatUserInputWidget({
    super.key,
    required this.controller,
    required this.send,
    required this.isWeb,
  });

  final TextEditingController controller;
  final bool isWeb;
  final Function() send;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 15, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: isWeb ? size.width * 0.5 : size.width * 0.75,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  hintText: "Ask tafooAI",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 254, 127, 33)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 254, 127, 33)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(73, 0, 0, 0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () async {
                  send();
                },
                child: RoundedBorderWithIcon(icon: Icons.arrow_forward),
              ),
            ),
          ],
        ));
  }
}
