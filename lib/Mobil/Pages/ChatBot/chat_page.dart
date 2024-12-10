import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafoo/Provider/chat_services_provider.dart';
import 'package:tafoo/Widgets/ChatBot/chat_buble.dart';
import 'package:tafoo/Widgets/ChatBot/chat_user_input_widget.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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
            padding: const EdgeInsets.only( top: 30),
            child: Image.asset(
              "assets/images/tafoologo.png",
              width: 100,
              height: 120,
            ),
          ),          
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final currentMessage = chatProvider.messages[index];
                return KeyedSubtree(
                  key: ValueKey(index),
                  child: ChatBuble(
                    isUserInput: currentMessage["isUser"],
                    message: currentMessage["message"],
                    isLoading: currentMessage["isLoading"] ?? false,
                    isWeb: false,
                  ),
                );
              },
            ),
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
            isWeb: false,
          ),
        ],
      ),
    );
  }
}







