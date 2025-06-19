import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soul_support/constants/constants.dart';

class patient {
  static const _baseUrl = "$baseUrl/api/";
  static Future<int> getpatientId(String email) async {
    var url = Uri.parse("${_baseUrl}getPatient_id");

    try {
      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("Therapist ID: ${data['id']}");
        int id = data['id'];
        return id;
      } else {
        print("Failed to fetch therapist names: ${res.statusCode}");
        return 0;
      }
    } catch (e) {
      print("Error fetching therapist names: ${e.toString()}");
      return 0;
    }
  }
}
