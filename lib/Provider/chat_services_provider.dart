import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatServicesProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _messages = [];
  String? _userInput;

  List<Map<String, dynamic>> get messages => List.unmodifiable(_messages);
  String? get userInput => _userInput;

  void addUserMessage(String message) {
    _messages.add({"message": message, "isUser": true});
    notifyListeners();
  }

  void addLoadingMessage() {
    _messages.add({"isUser": false, "isLoading": true});
    notifyListeners();
  }

  void updateLastMessage(String response) {
    if (_messages.isNotEmpty && _messages.last["isLoading"] == true) {
      _messages.removeLast();
    }
    _messages.add({"message": response, "isUser": false});
    notifyListeners();
  }

  Future<void> sendMessage(String userMessage) async {
    addUserMessage(userMessage);
    addLoadingMessage();

    try {
      String? aiResponse = await fetchAiResult(userMessage);
      updateLastMessage(aiResponse ?? "No response received.");
    } catch (e) {
      updateLastMessage("Error: ${e.toString()}");
    }
  }

  Future<String?> fetchAiResult(String userMessage) async {
    var url = Uri.parse('http://10.82.15.147:8000/ask-ai');
    try {
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"message": userMessage}),
      );

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        return decodedData['response'];
      } else {
        print('API error: ${response.statusCode}, Response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}

