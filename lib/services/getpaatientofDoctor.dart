import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soul_support/constants/constants.dart';
 class Getpaatientofdoctor {
   static const _baseUrl = "$baseUrl/api/";
   
// s
static Future<List<int>> getPatientsByTherapistId(String therapistId) async {
  final url = Uri.parse("${_baseUrl}getpatientbytherapistid?therapist_id=$therapistId");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> ids = data['patient_ids'];

      List<int> patientIds = ids.map<int>((id) => int.parse(id.toString())).toList();
      print("Patient IDs: $patientIds");
      return patientIds;
    } else {
      print("Failed to fetch patients: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Error fetching patients: $e");
    return [];
  }
}


 }
