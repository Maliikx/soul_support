import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile_model.dart';

class ProfileService {
  static String get baseUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:5000/api';

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<Map<String, String>> _getHeaders() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  // Get therapist profile
  static Future<ProfileModel> getProfile() async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/therapist/profile'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update therapist profile
  static Future<ProfileModel> updateProfile(ProfileModel profile) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('$baseUrl/therapist/profile'),
        headers: headers,
        body: json.encode(profile.toJson()),
      );

      if (response.statusCode == 200) {
        return ProfileModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update profile image
  static Future<String> updateProfileImage(String imagePath) async {
    try {
      final headers = await _getHeaders();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/therapist/profile/image'),
      );

      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('image', imagePath));

      final response = await request.send();
      final responseData = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseData);
        return data['imageUrl'];
      } else {
        throw Exception('Failed to update profile image');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update working hours
  static Future<Map<String, dynamic>> updateWorkingHours(Map<String, dynamic> workingHours) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('$baseUrl/therapist/profile/working-hours'),
        headers: headers,
        body: json.encode(workingHours),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update working hours');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update settings
  static Future<Map<String, dynamic>> updateSettings(Map<String, dynamic> settings) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('$baseUrl/therapist/profile/settings'),
        headers: headers,
        body: json.encode(settings),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to update settings');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Change password
  static Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse('$baseUrl/therapist/profile/change-password'),
        headers: headers,
        body: json.encode({
          'currentPassword': currentPassword,
          'newPassword': newPassword,
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to change password');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
} 