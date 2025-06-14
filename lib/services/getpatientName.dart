// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class GetPatientById {
//   static const baseUrl = "http://10.0.2.2:3000/api/";

//   static Future<String?> fetchPatientName(String patientId) async {
//     final url = Uri.parse("${baseUrl}getpatientname?patient_id=$patientId");

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         // Adjust the key 'patient_name' if your backend uses a different key in JSON
//         if (data['status_code'] == 200 && data['patient_name'] != null) {
//           print("Patient name: ${data['patient_name']}");
//           return data['patient_name'];
//         } else {
//           print("Patient not found or no name returned");
//           return null;
//         }
//       } else {
//         print("Failed to fetch patient name: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("Error fetching patient name: $e");
//       return null;
//     }
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class GetPatientById {
//   static const baseUrl = "http://10.0.2.2:3000/api/";

//   /// Accepts list of patient IDs and returns Map<int, String> id->name
// any change here 
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class GetPatientById {
//   static const baseUrl = "http://10.0.2.2:3000/api/";

//   static Future<String?> fetchPatientName(String patientId) async {
//     final url = Uri.parse("${baseUrl}getpatientname?patient_id=$patientId");

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);

//         // Adjust the key 'patient_name' if your backend uses a different key in JSON
//         if (data['status_code'] == 200 && data['patient_name'] != null) {
//           print("Patient name: ${data['patient_name']}");
//           return data['patient_name'];
//         } else {
//           print("Patient not found or no name returned");
//           return null;
//         }
//       } else {
//         print("Failed to fetch patient name: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("Error fetching patient name: $e");
//       return null;
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetPatientById {
  static const baseUrl = "http://10.0.2.2:3000/api/";

  /// Accepts list of patient IDs and returns Map<int, String> id->name
 static Future<List<String>> fetchPatientNamesByIds(List<int> ids) async {
  final url = Uri.parse("${baseUrl}get_patientNamesByIds");

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


