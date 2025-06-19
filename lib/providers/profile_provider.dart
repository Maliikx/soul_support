import 'package:flutter/foundation.dart';
import '../models/profile_model.dart';
import '../services/profile_service.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel? _profile;
  bool _isLoading = false;
  String? _error;

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _error = message;
    notifyListeners();
  }

  Future<void> loadProfile() async {
    try {
      _setLoading(true);
      _setError(null);
      _profile = await ProfileService.getProfile();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateProfile(ProfileModel updatedProfile) async {
    try {
      _setLoading(true);
      _setError(null);
      _profile = await ProfileService.updateProfile(updatedProfile);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateProfileImage(String imagePath) async {
    try {
      _setLoading(true);
      _setError(null);
      final imageUrl = await ProfileService.updateProfileImage(imagePath);
      if (_profile != null) {
        _profile = _profile!.copyWith(imageUrl: imageUrl);
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateWorkingHours(Map<String, dynamic> workingHours) async {
    try {
      _setLoading(true);
      _setError(null);
      await ProfileService.updateWorkingHours(workingHours);
      if (_profile != null) {
        _profile = _profile!.copyWith(workingHours: workingHours);
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateSettings(Map<String, dynamic> settings) async {
    try {
      _setLoading(true);
      _setError(null);
      await ProfileService.updateSettings(settings);
      if (_profile != null) {
        _profile = _profile!.copyWith(settings: settings);
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      _setLoading(true);
      _setError(null);
      await ProfileService.changePassword(currentPassword, newPassword);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
} 