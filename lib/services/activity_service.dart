import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class ActivityService {
  // Get today's activity
  // static Future<Map<String, dynamic>> getTodayActivity() async {
  //   final response = await http.get(
  //     // Uri.parse('${ApiService.baseUrl}/activities/today'),
  //     // headers: await ApiService.getHeaders(),
  //   );

    // return ApiService.handleResponse(response);
  }

  // Get activity history
  // static Future<List<dynamic>> getActivityHistory({
  //   DateTime? startDate,
  //   DateTime? endDate,
  // }) async {
  //   final queryParams = <String, String>{};
  //   if (startDate != null) {
  //     queryParams['startDate'] = startDate.toIso8601String();
  //   }
  //   if (endDate != null) {
  //     queryParams['endDate'] = endDate.toIso8601String();
  //   }

  //   final uri = Uri.parse('${ApiService.baseUrl}/activities/history')
  //       .replace(queryParameters: queryParams);
  //
  //   final response = await http.get(
  //     uri,
  //     headers: await ApiService.getHeaders(),
  //   );
  //
  //   final data = ApiService.handleResponse(response);
  //   return data['activities'] ?? [];
  // }

  // Add new activity
  // static Future<Map<String, dynamic>> addActivity(
  //   String type,
  //   String description,
  //   DateTime dateTime,
  // ) async {
  //   final response = await http.post(
  //     Uri.parse('${ApiService.baseUrl}/activities'),
  //     headers: await ApiService.getHeaders(),
  //     body: json.encode({
  //       'type': type,
  //       'description': description,
  //       'dateTime': dateTime.toIso8601String(),
  //     }),
  //   );

//     return ApiService.handleResponse(response);
//   }
// }