import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class AppointmentService {
  // Get today's appointments
  // static Future<List<dynamic>> getTodayAppointments() async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/appointments/today'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   return data['appointments'] ?? [];
  // }

  // Get all appointments
  // static Future<List<dynamic>> getAllAppointments() async {
  //   final response = await http.get(
  //     Uri.parse('${ApiService.baseUrl}/appointments'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   return data['appointments'] ?? [];
  // }

  // Create new appointment
  // static Future<Map<String, dynamic>> createAppointment(
  //   String patientId,
  //   DateTime dateTime,
  //   String notes,
  // ) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiService.baseUrl}/appointments'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       'patientId': patientId,
  //       'dateTime': dateTime.toIso8601String(),
  //       'notes': notes,
  //     }),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }

  // Update appointment
  // static Future<Map<String, dynamic>> updateAppointment(
  //   String appointmentId,
  //   DateTime? dateTime,
  //   String? notes,
  //   String? status,
  // ) async {
  //   final response = await http.put(
  //     Uri.parse('${ApiService.baseUrl}/appointments/$appointmentId'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       if (dateTime != null) 'dateTime': dateTime.toIso8601String(),
  //       if (notes != null) 'notes': notes,
  //       if (status != null) 'status': status,
  //     }),
  //   );
  //
  //   return ApiService.handleResponse(response);
  // }

  // Delete appointment
  // static Future<void> deleteAppointment(String appointmentId) async {
  //   final response = await http.delete(
  //     Uri.parse('${ApiService.baseUrl}/appointments/$appointmentId'),
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   ApiService.handleResponse(response);
  // }
}