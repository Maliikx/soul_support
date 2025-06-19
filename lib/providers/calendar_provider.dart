import 'package:flutter/foundation.dart';
import '../models/calendar_model.dart';
import '../services/calendar_service.dart';

class CalendarProvider with ChangeNotifier {
  List<CalendarModel> _events = [];
  bool _isLoading = false;
  String? _error;
  DateTime _selectedDate = DateTime.now();
  String? _selectedType;

  List<CalendarModel> get events => _events;
  bool get isLoading => _isLoading;
  String? get error => _error;
  DateTime get selectedDate => _selectedDate;
  String? get selectedType => _selectedType;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _error = message;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    loadDayEvents();
  }

  void setSelectedType(String? type) {
    _selectedType = type;
    if (type != null) {
      loadEventsByType(type);
    } else {
      loadMonthEvents(_selectedDate);
    }
  }

  Future<void> loadMonthEvents(DateTime month) async {
    try {
      _setLoading(true);
      _setError(null);
      _events = await CalendarService.getMonthEvents(month);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadDayEvents() async {
    try {
      _setLoading(true);
      _setError(null);
      _events = await CalendarService.getDayEvents(_selectedDate);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadEventsByType(String type) async {
    try {
      _setLoading(true);
      _setError(null);
      _events = await CalendarService.getEventsByType(type);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> createEvent(CalendarModel event) async {
    try {
      _setLoading(true);
      _setError(null);
      final newEvent = await CalendarService.createEvent(event);
      _events.add(newEvent);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateEvent(String id, CalendarModel event) async {
    try {
      _setLoading(true);
      _setError(null);
      final updatedEvent = await CalendarService.updateEvent(id, event);
      final index = _events.indexWhere((e) => e.id == id);
      if (index != -1) {
        _events[index] = updatedEvent;
        notifyListeners();
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteEvent(String id) async {
    try {
      _setLoading(true);
      _setError(null);
      await CalendarService.deleteEvent(id);
      _events.removeWhere((e) => e.id == id);
      notifyListeners();
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