import 'dart:convert';
import 'package:http/http.dart' as http;
 class Getpaatientofdoctor {
   static const baseUrl = "http://10.0.2.2:3000/api/";
   
// s
static Future<List<int>> getPatientsByTherapistId(String therapistId) async {
  final url = Uri.parse("${baseUrl}getpatientbytherapistid?therapist_id=$therapistId");

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
