// import 'package:flutter/foundation.dart';
// import '../models/notification_model.dart';
// import '../services/notification_service.dart';
//
// class NotificationProvider with ChangeNotifier {
//   List<NotificationModel> _notifications = [];
//   bool _isLoading = false;
//   String? _error;
//   int _unreadCount = 0;
//   int _currentPage = 1;
//   bool _hasMore = true;
//
//   List<NotificationModel> get notifications => _notifications;
//   bool get isLoading => _isLoading;
//   String? get error => _error;
//   int get unreadCount => _unreadCount;
//   bool get hasMore => _hasMore;
//
//   void _setLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   void _setError(String? message) {
//     _error = message;
//     notifyListeners();
//   }
//
//   Future<void> loadNotifications({bool refresh = false}) async {
//     try {
//       if (refresh) {
//         _currentPage = 1;
//         _notifications = [];
//         _hasMore = true;
//       }
//
//       if (!_hasMore || _isLoading) return;
//
//       _setLoading(true);
//       _setError(null);
//
//       final result = await NotificationService.getNotifications(
//         page: _currentPage,
//         limit: 20,
//       );
//
//       final List<NotificationModel> newNotifications = (result['notifications'] as List)
//           .map((json) => NotificationModel.fromJson(json))
//           .toList();
//
//       if (refresh) {
//         _notifications = newNotifications;
//       } else {
//         _notifications.addAll(newNotifications);
//       }
//
//       _hasMore = _currentPage < result['totalPages'];
//       _currentPage++;
//
//       await loadUnreadCount();
//     } catch (e) {
//       _setError(e.toString());
//     } finally {
//       _setLoading(false);
//     }
//   }
//
//   Future<void> loadUnreadCount() async {
//     try {
//       _unreadCount = await NotificationService.getUnreadCount();
//       notifyListeners();
//     } catch (e) {
//       print('Error loading unread count: $e');
//     }
//   }
//
//   Future<void> markAsRead(String notificationId) async {
//     try {
//       await NotificationService.markAsRead(notificationId);
//       final index = _notifications.indexWhere((n) => n.id == notificationId);
//       if (index != -1) {
//         _notifications[index] = NotificationModel(
//           id: _notifications[index].id,
//           title: _notifications[index].title,
//           message: _notifications[index].message,
//           type: _notifications[index].type,
//           read: true,
//           data: _notifications[index].data,
//           createdAt: _notifications[index].createdAt,
//         );
//         notifyListeners();
//       }
//       await loadUnreadCount();
//     } catch (e) {
//       _setError(e.toString());
//     }
//   }
//
//   Future<void> markAllAsRead() async {
//     try {
//       await NotificationService.markAllAsRead();
//       _notifications = _notifications.map((notification) => NotificationModel(
//         id: notification.id,
//         title: notification.title,
//         message: notification.message,
//         type: notification.type,
//         read: true,
//         data: notification.data,
//         createdAt: notification.createdAt,
//       )).toList();
//       notifyListeners();
//       await loadUnreadCount();
//     } catch (e) {
//       _setError(e.toString());
//     }
//   }
//
//   Future<void> deleteNotification(String notificationId) async {
//     try {
//       await NotificationService.deleteNotification(notificationId);
//       _notifications.removeWhere((n) => n.id == notificationId);
//       notifyListeners();
//       await loadUnreadCount();
//     } catch (e) {
//       _setError(e.toString());
//     }
//   }
//
//   void clearError() {
//     _error = null;
//     notifyListeners();
//   }
// }