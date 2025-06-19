
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soul_support/constants/constants.dart';

class ApiService {
  static const String url = '$baseUrl';

  static Future<Map<String, dynamic>> getSessionToken(
    String sessionId,
    int userId,
  ) async {
    final response = await http.get(
      Uri.parse('$url/sessions/$sessionId/token?uid=$userId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get token: ${response.body}');
    }
  }

  static Future<void> updateSessionStatus(
    String sessionId,
    String status,
  ) async {
    await http.patch(
      Uri.parse('$url/sessions/$sessionId/status'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'status': status}),
    );
  }
}
