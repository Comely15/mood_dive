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

  Future<String> sendMessage(
    String message,
    String styleContext, {
    String ageGroup = '30s',
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'message': message,
          'style_context': styleContext,
          'age_group': ageGroup,
        }),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body['response'];
      } else {
        throw Exception('Failed to get chat response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('채팅 서버 연결 실패: $e\n\nOllama와 백엔드 서버가 실행 중인지 확인해주세요.');
    }
  }

  Future<String> getGreeting(String styleContext, {String ageGroup = '30s'}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/greeting'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'style_context': styleContext,
          'age_group': ageGroup,
        }),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body['response'];
      } else {
        return '안녕하세요! "$styleContext" 스타일을 선택하셨네요. 어떤 제품을 찾고 계신가요?';
      }
    } catch (e) {
      return '안녕하세요! "$styleContext" 스타일을 선택하셨네요. 어떤 제품을 찾고 계신가요?';
    }
  }

  Future<bool> checkHealth() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
