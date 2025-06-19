import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soul_support/constants/constants.dart';

class doctorid {
  static const _baseUrl = "$baseUrl/api/";
  static Future<int> getdoctorId(String name) async {
  final url = Uri.parse("${_baseUrl}getdoctor1_id?name=$name");

  try {
    final res = await http.get(url); // Use GET

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print("doctor ID: ${data['id']}");
      return data['id'];
    } else {
      print("Failed to fetch doctor ID: ${res.statusCode}");
      return 0;
    }
  } catch (e) {
    print("Error fetching patient ID: ${e.toString()}");
    return 0;
  }
}

}
