import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soul_support/constants/constants.dart';

class Getdoctorbyemail {
  static const _baseUrl = "$baseUrl/api/";
  static Future<int> getpatientId(String email) async {
  final url = Uri.parse("${_baseUrl}getdoctorbymail_id?email=$email");

  try {
    final res = await http.get(url); // Use GET

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print("doctor ID: ${data['id']}");
      return data['id'];
    } else {
      print("Failed to fetch patient ID: ${res.statusCode}");
      return 0;
    }
  } catch (e) {
    print("Error fetching patient ID: ${e.toString()}");
    return 0;
  }
}

}
