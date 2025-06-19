
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soul_support/constants/constants.dart';

class Api {
  static const _baseUrl = "$baseUrl/api/";

  static Future<void> addTherapist(Map<String, dynamic> ddata) async {}

  static Future<List<String>> getTherapist() async {
    List<String> product = [];
    var url = Uri.parse("${_baseUrl}get_therapistName");

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        List doctorList = data['doctor'];

        List<String> names = doctorList.map<String>((item) {
          if (item is Map<String, dynamic>) {
            return item['name'] ?? 'Unnamed';
          }
          return item.toString();
        }).toList();

        print("Therapist names: $names");
        return names;
      } else {
        print("Failed to fetch therapist names: ${res.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error fetching therapist names: ${e.toString()}");
      return [];
    }
  }
}
