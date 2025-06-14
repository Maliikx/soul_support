import 'package:http/http.dart' as http;
import 'dart:convert';

class Getdoctorbyemail {
  static const baseUrl = "http://10.0.2.2:3000/api/";
  static Future<int> getpatientId(String email) async {
  final url = Uri.parse("${baseUrl}getdoctorbymail_id?email=$email");

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
