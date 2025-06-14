import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _name;
  String? _email;
  String? _phone;
  String? _specialization;
  String? _licenseNumber;
  bool _isLoading = false;
  String? _error;

  bool get isAuthenticated => _token != null;
  bool get isLoading => _isLoading;
  String? get token => _token;
  String? get userId => _userId;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get specialization => _specialization;
  String? get licenseNumber => _licenseNumber;
  String? get error => _error;

  Future<void> signIn(String email, String password) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // final response = await ApiService.signIn(email, password);
      // _token = response['token'];
      // _userId = response['therapist']['id'].toString();
      // _name = response['therapist']['name'];
      // _email = response['therapist']['email'];
      // _phone = response['therapist']['phone'];
      // _specialization = response['therapist']['specialization'];
      // _licenseNumber = response['therapist']['licenseNumber'];

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('userId', _userId!);
      await prefs.setString('name', _name!);
      await prefs.setString('email', _email!);
      await prefs.setString('phone', _phone!);
      await prefs.setString('specialization', _specialization!);
      await prefs.setString('licenseNumber', _licenseNumber!);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String specialization,
    required String licenseNumber,
    required String phone,
  }) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // final response = await ApiService.signUp(
      //   email: email,
      //   password: password,
      //   name: name,
      //   specialization: specialization,
      //   licenseNumber: licenseNumber,
      //   phone: phone,
      // );
      // _token = response['token'];
      // _userId = response['therapist']['id'].toString();
      // _name = response['therapist']['name'];
      // _email = response['therapist']['email'];
      // _phone = response['therapist']['phone'];
      // _specialization = response['therapist']['specialization'];
      // _licenseNumber = response['therapist']['licenseNumber'];

      // Save to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', _token!);
      await prefs.setString('userId', _userId!);
      await prefs.setString('name', _name!);
      await prefs.setString('email', _email!);
      await prefs.setString('phone', _phone!);
      await prefs.setString('specialization', _specialization!);
      await prefs.setString('licenseNumber', _licenseNumber!);
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _token = null;
      _userId = null;
      _name = null;
      _email = null;
      _phone = null;
      _specialization = null;
      _licenseNumber = null;

      // Clear local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('token');
      await prefs.remove('userId');
      await prefs.remove('name');
      await prefs.remove('email');
      await prefs.remove('phone');
      await prefs.remove('specialization');
      await prefs.remove('licenseNumber');
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> checkAuthStatus() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');
      _userId = prefs.getString('userId');
      _name = prefs.getString('name');
      _email = prefs.getString('email');
      _phone = prefs.getString('phone');
      _specialization = prefs.getString('specialization');
      _licenseNumber = prefs.getString('licenseNumber');

      if (_token != null) {
        try {
          // You might want to add a token validation endpoint
          // await ApiService.validateToken(_token!);
        } catch (e) {
          _token = null;
          _userId = null;
          _name = null;
          _email = null;
          _phone = null;
          _specialization = null;
          _licenseNumber = null;
          await prefs.remove('token');
          await prefs.remove('userId');
          await prefs.remove('name');
          await prefs.remove('email');
          await prefs.remove('phone');
          await prefs.remove('specialization');
          await prefs.remove('licenseNumber');
        }
      }
    } catch (e) {
      _error = e.toString();
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
