import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class TherapistService {
  // Login
  // static Future<Map<String, dynamic>> login(String email, String password) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiService.baseUrl}/therapist/login'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   if (data['token'] != null) {
  //     await ApiService.setToken(data['token']);
  //   }
  //   return data;
  // }

  // Register
  // static Future<Map<String, dynamic>> register(
  //   String name,
  //   String email,
  //   String password,
  //   String specialization,
  //   int experience,
  // ) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiService.baseUrl}/therapist/register'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'specialization': specialization,
  //       'experience': experience,
  //     }),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   if (data['token'] != null) {
  //     await ApiService.setToken(data['token']);
  //   }
  //   return data;
  // }
  //
  // // Get Profile
  // static Future<Map<String, dynamic>> getProfile() async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/therapist/profile'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }
  //
  // // Update Profile
  // static Future<Map<String, dynamic>> updateProfile({
  //   String? name,
  //   String? specialization,
  //   int? experience,
  // }) async {
  //   final response = await http.put(
  //     Uri.parse('${ApiService.baseUrl}/therapist/profile'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       if (name != null) 'name': name,
  //       if (specialization != null) 'specialization': specialization,
  //       if (experience != null) 'experience': experience,
  //     }),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }
  //
  // // Logout
  // static Future<void> logout() async {
  //   await ApiService.removeToken();
  // }
}