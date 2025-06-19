import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class PatientService {
  // Get all patients
  // static Future<List<dynamic>> getPatients() async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/patients'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   return data['patients'] ?? [];
  // }

  // Add new patient
  // static Future<Map<String, dynamic>> addPatient({
  //   required String name,
  //   required String email,
  //   required String phone,
  // }) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiService.baseUrl}/patients'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       'name': name,
  //       'email': email,
  //       'phone': phone,
  //     }),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }

  // Get patient details
  // static Future<Map<String, dynamic>> getPatientDetails(String patientId) async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/patients/$patientId'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }

  // Get patient progress
  // static Future<Map<String, dynamic>> getPatientProgress(String patientId) async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/patients/$patientId/progress'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }
  //
  // // Update patient information
  // static Future<Map<String, dynamic>> updatePatient({
  //   required String patientId,
  //   String? name,
  //   String? phone,
  // }) async {
  //   final response = await http.put(
  //     Uri.parse('${ApiService.baseUrl}/patients/$patientId'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       if (name != null) 'name': name,
  //       if (phone != null) 'phone': phone,
  //     }),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }
} 