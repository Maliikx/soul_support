import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/calendar_model.dart';

class CalendarService {
  static String get baseUrl =>  'http://localhost:5000/api';

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

  // Get calendar events for a specific month
  static Future<List<CalendarModel>> getMonthEvents(DateTime month) async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/calendar/month/${month.year}/${month.month}'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CalendarModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load calendar events');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get calendar events for a specific day
  static Future<List<CalendarModel>> getDayEvents(DateTime date) async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/calendar/day/${date.year}/${date.month}/${date.day}'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CalendarModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load day events');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Create a new calendar event
  static Future<CalendarModel> createEvent(CalendarModel event) async {
    try {
      final headers = await _getHeaders();
      final response = await http.post(
        Uri.parse('$baseUrl/calendar'),
        headers: headers,
        body: json.encode(event.toJson()),
      );

      if (response.statusCode == 201) {
        return CalendarModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to create event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Update an existing calendar event
  static Future<CalendarModel> updateEvent(String id, CalendarModel event) async {
    try {
      final headers = await _getHeaders();
      final response = await http.put(
        Uri.parse('$baseUrl/calendar/$id'),
        headers: headers,
        body: json.encode(event.toJson()),
      );

      if (response.statusCode == 200) {
        return CalendarModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to update event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Delete a calendar event
  static Future<void> deleteEvent(String id) async {
    try {
      final headers = await _getHeaders();
      final response = await http.delete(
        Uri.parse('$baseUrl/calendar/$id'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete event');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Get events by type (appointments, activities, etc.)
  static Future<List<CalendarModel>> getEventsByType(String type) async {
    try {
      final headers = await _getHeaders();
      final response = await http.get(
        Uri.parse('$baseUrl/calendar/type/$type'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CalendarModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load events by type');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
} 