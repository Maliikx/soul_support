// // // import 'package:http/http.dart' as http;
// // // import 'dart:convert';

// // // class ApiService {
// // //   static const baseUrl = 'http://10.0.2.2:8080';

// // //   static Future<Map<String, dynamic>> fetchAgoraToken(String sessionId, int uid) async {
// // //     final response = await http.get(
// // //       Uri.parse('$baseUrl/session/$sessionId/token?uid=$uid'),
// // //     );
// // //     if (response.statusCode == 200) {
// // //       return jsonDecode(response.body);
// // //     } else {
// // //       throw Exception('Failed to fetch token');
// // //     }
// // //   }

// // //   static Future<void> updateSessionStatus(String sessionId, String status) async {
// // //     final response = await http.patch(
// // //       Uri.parse('$baseUrl/session/$sessionId/status'),
// // //       headers: {'Content-Type': 'application/json'},
// // //       body: jsonEncode({'status': status}),
// // //     );
// // //     if (response.statusCode != 200) {
// // //       throw Exception('Failed to update session status');
// // //     }
// // //   }
// // // }
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // // api_service.dart
// // class ApiService {
// //   static const String baseUrl = 'http://10.0.2.2:8080';

// //   // Create new therapy session
// //   static Future<Map<String, dynamic>> createTherapySession({
// //     required String name,
// //     required int duration,
// //     required int doctorId,
// //     required int patientId,
// //   }) async {
// //     final response = await http.post(
// //       Uri.parse('$baseUrl/sessions/start'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'name': name,
// //         'duration': duration,
// //         'doctorId': doctorId,
// //         'patientId': patientId,
// //         'status': 'scheduled',
// //       }),
// //     );
    
// //     if (response.statusCode == 201) {
// //       return jsonDecode(response.body);
// //     } else {
// //       throw Exception('Failed to create session');
// //     }
// //   }

// //   // Get Agora token for session
// //   static Future<Map<String, dynamic>> getSessionToken(
// //     String sessionId,
// //     int userId,
// //   ) async {
// //     final response = await http.get(
// //       Uri.parse('$baseUrl/sessions/$sessionId/token?uid=$userId'),
// //     );
    
// //     if (response.statusCode == 200) {
// //       return jsonDecode(response.body);
// //     } else {
// //       throw Exception('Failed to get token');
// //     }
// //   }

// //   // Update session status
// //   static Future<void> updateSessionStatus(
// //     String sessionId,
// //     String status,
// //   ) async {
// //     final response = await http.patch(
// //       Uri.parse('$baseUrl/sessions/$sessionId/status'),
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({'status': status}),
// //     );
    
// //     if (response.statusCode != 200) {
// //       print('Failed to update session status');
// //     }
// //   }
// // }
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   static const String baseUrl = 'http://10.0.2.2:3000'; // For Android emulator

//   // Create new therapy session
//   static Future<Map<String, dynamic>> createTherapySession({
//     required String name,
//     required int duration,
//     required int doctorId,
//     required int patientId,
//   }) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/sessions/start'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'name': name,
//           'duration': duration,
//           'doctorId': doctorId,
//           'patientId': patientId,
//         }),
//       );

//       if (response.statusCode == 201) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to create session: ${response.body}');
//       }
//     } catch (e) {
//       throw Exception('Network error: $e');
//     }
//   }

//   // Get Agora token for session
//   static Future<Map<String, dynamic>> getSessionToken(
//     String sessionId,
//     int userId,
//   ) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/sessions/$sessionId/token?uid=$userId'),
//       );

//       if (response.statusCode == 200) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception('Failed to get token: ${response.body}');
//       }
//     } catch (e) {
//       throw Exception('Network error: $e');
//     }
//   }

//   // Update session status
//   static Future<void> updateSessionStatus(
//     String sessionId,
//     String status,
//   ) async {
//     try {
//       final response = await http.patch(
//         Uri.parse('$baseUrl/sessions/$sessionId/status'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'status': status}),
//       );

//       if (response.statusCode != 200) {
//         print('Failed to update status: ${response.body}');
//       }
//     } catch (e) {
//       print('Error updating status: $e');
//     }
//   }
//   static Future<void> testBackendConnection() async {
//   try {
//     final response = await http.get(
//       Uri.parse('$baseUrl/'),
//       headers: {'Content-Type': 'application/json'},
//     ).timeout(const Duration(seconds: 30));

//     print('Backend connection test: ${response.statusCode} - ${response.body}');
//   } catch (e) {
//     print('Backend connection FAILED: $e');
//     rethrow;
//   }
// }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:3000';

  static Future<Map<String, dynamic>> getSessionToken(
    String sessionId,
    int userId,
  ) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sessions/$sessionId/token?uid=$userId'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get token: ${response.body}');
    }
  }

  static Future<void> updateSessionStatus(
    String sessionId,
    String status,
  ) async {
    await http.patch(
      Uri.parse('$baseUrl/sessions/$sessionId/status'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'status': status}),
    );
  }
}
