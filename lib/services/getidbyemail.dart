import 'package:http/http.dart' as http;
import 'dart:convert';

class patient {
  static const baseUrl = "http://192.168.124.134:3000/api/";
  static Future<int> getpatientId(String email) async {
    var url = Uri.parse("${baseUrl}getPatient_id");

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
