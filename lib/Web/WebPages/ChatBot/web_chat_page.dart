import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/services/chat_services_provider.dart';
import 'package:tafoo/Widgets/ChatBot/chat_buble.dart';
import 'package:tafoo/Widgets/ChatBot/chat_user_input_widget.dart';

class WebChatPage extends StatefulWidget {
  @override
  State<WebChatPage> createState() => _WebChatPageState();
}

class _WebChatPageState extends State<WebChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  bool activateDefaultMessage = true;
  String defaultMessage = "";
  bool activateDefaultMessage2 = false;
  String defaultMessage2 = "";

  void scrollDown({bool animated = true}) {
    if (_scrollController.hasClients) {
      if (animated) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      } else {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    }
  }

  @override
  void initState() {
    super.initState(); // This line is important

    // Show the first message after 2 seconds and hide the loading indicator
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        activateDefaultMessage = false;
        defaultMessage = "Merhaba, ben tafooAI";
      });

      // After a further 2 seconds, show the second message
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          activateDefaultMessage2 = false;
          defaultMessage2 =
              "Dilediğin soruyu bana sorabilirsin, ben tafooAI, memnuniyetle sorularını bekliyorum ☺️";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatServicesProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollDown();
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 30, 0.95),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              "assets/images/tafoologo.png",
              width: 100,
              height: 120,
            ),
          ),
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: chatProvider.messages.length +
                    2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ChatBuble(
                      isUserInput: false,
                      isLoading: activateDefaultMessage,
                      isWeb: true,
                      message: defaultMessage,
                    );
                  }
                  else if (index == 1 && !activateDefaultMessage) {
                    return ChatBuble(
                      isUserInput: false,
                      isLoading: activateDefaultMessage2,
                      isWeb: true,
                      message: defaultMessage2,
                    );
                  }
                  else {
                    final adjustedIndex = index - 2;
                    if (adjustedIndex >= 0 &&
                        adjustedIndex < chatProvider.messages.length) {
                      final currentMessage =
                          chatProvider.messages[adjustedIndex];
                      return KeyedSubtree(
                        key: ValueKey(index),
                        child: ChatBuble(
                          isUserInput: currentMessage["isUser"],
                          message: currentMessage["message"],
                          isLoading: currentMessage["isLoading"] ?? false,
                          isWeb: true,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }
                }),
          ),
          ChatUserInputWidget(
            controller: _messageController,
            send: () {
              final userMessage = _messageController.text;
              if (userMessage.isNotEmpty) {
                chatProvider.sendMessage(userMessage);
                _messageController.clear();
              }
            },
            isWeb: true,
          ),
        ],
      ),
    );
  }
}
