import 'dart:convert';
import 'package:http/http.dart' as http;

class Patientservice {
  static Future<void> createPost(String FirstName,String PhoneNumber ,String email, String Gender,
      String password, String Moodlogging) async {
    final url = Uri.parse('http://10.0.2.2:3000/patient/post');
    final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "FirstName": FirstName,
          "PhoneNumber":PhoneNumber,
          "email": email,
          "Gender": Gender,
          "password": password,
          "Moodlogging": Moodlogging
        }));
        if(response.statusCode==201){
                print("Post Created Successfully");

        }
        else {
      print("Failed to create post: ${response.body}");
    }

  }
}
