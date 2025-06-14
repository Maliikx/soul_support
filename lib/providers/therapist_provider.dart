import 'package:flutter/foundation.dart';
import '../services/therapist_service.dart';
import '../services/patient_service.dart';
import '../services/appointment_service.dart';
import '../services/activity_service.dart';

class TherapistProvider with ChangeNotifier {
  Map<String, dynamic>? _profile;
  List<dynamic>? _patients;
  List<dynamic>? _todayAppointments;
  Map<String, dynamic>? _todayActivity;
  bool _isLoading = false;
  String? _error;

  Map<String, dynamic>? get profile => _profile;
  List<dynamic>? get patients => _patients;
  List<dynamic>? get todayAppointments => _todayAppointments;
  Map<String, dynamic>? get todayActivity => _todayActivity;
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

  void clearError() {
    _error = null;
    notifyListeners();
  }

  Future<void> loadProfile() async {
    try {
      _setLoading(true);
      _setError(null);
      // _profile = await TherapistService.getProfile();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadPatients() async {
    try {
      _setLoading(true);
      _setError(null);
      // _patients = await PatientService.getPatients();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadTodayAppointments() async {
    try {
      _setLoading(true);
      _setError(null);
      // _todayAppointments = await AppointmentService.getTodayAppointments();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadTodayActivity() async {
    try {
      _setLoading(true);
      _setError(null);
      // _todayActivity = await ActivityService.getTodayActivity();
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refreshAll() async {
    try {
      _setLoading(true);
      _setError(null);
      await Future.wait([
        loadProfile(),
        loadPatients(),
        loadTodayAppointments(),
        loadTodayActivity(),
      ]);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }
}