import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

class ChatService {
  String get baseUrl {
    if (kIsWeb) return 'http://127.0.0.1:8000';
    if (Platform.isAndroid) return 'http://10.0.2.2:8000';
    return 'http://127.0.0.1:8000';
  }

  Future<String> sendMessage(String message, String styleContext) async {
    final response = await http.post(
      Uri.parse('$baseUrl/chat'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message, 'style_context': styleContext}),
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body['response'];
    } else {
      throw Exception('Failed to get chat response');
    }
  }
}
