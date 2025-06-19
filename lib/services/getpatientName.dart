
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soul_support/constants/constants.dart';

class GetPatientById {
  static const _baseUrl = "$baseUrl/api/";

  /// Accepts list of patient IDs and returns Map<int, String> id->name
 static Future<List<String>> fetchPatientNamesByIds(List<int> ids) async {
  final url = Uri.parse("${_baseUrl}get_patientNamesByIds");

  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"patient_ids": ids}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['status_code'] == 200 && data['patientNames'] != null) {
        return (data['patientNames'] as List)
            .map<String>((item) => item['name'] ?? 'Unnamed')
            .toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
}

}


