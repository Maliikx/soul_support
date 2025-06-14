import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class NotificationPage extends StatefulWidget {
  final int patientId;

  const NotificationPage({super.key, required this.patientId});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    initializeNotifications().then((_) {
      createNotificationChannel();
      // scheduleDailyReminder();
      fetchAndNotify(); // Fetch once on start

      //Re-fetch every 30 seconds
      Timer.periodic(const Duration(hours: 24), (timer) {
        fetchAndNotify();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -15,
              left: 30,
              child: Transform.rotate(
                angle: 0.4,
                child: Container(
                  width: 720,
                  height: 750,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          Positioned(
              top: 480,
              left: 300,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(255, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),

          Positioned(
            left: 10,
            right: 5,
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xffFFFFFF).withOpacity(0.6),
              ),
              width: 398,
              height: 740,
              child: _messages.isEmpty
                  ? const Center(child: Text('No notifications yet.'))
                  : ListView.builder(
                   itemCount: _messages.length,
                   itemBuilder: (context, index) {
                   return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white.withOpacity(0.8),
                    child: ListTile(
                      title: Text(
                        _messages[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff374957),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
        android: androidSettings);

    // Initialize plugin
    bool initializationResult = await flutterLocalNotificationsPlugin
        .initialize(initializationSettings) ?? false;

    if (!initializationResult) {
      print('Notification plugin failed to initialize.');
      return;
    }

    // Setup the notification channel for Android 8.0 and above
    if (Platform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'your_channel_id', // Unique ID for your channel
        'Your Channel Name',
        description: 'This channel is used for important notifications',
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }


  Future<void> createNotificationChannel() async {
    if (Platform.isAndroid) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'your_channel_id', // Unique ID for your channel
        'Your Channel Name',
        description: 'This channel is used for important notifications',
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }

  Future<void> requestNotificationPermission() async {
    final bool isPermissionGranted = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission() ?? false;

    if (!isPermissionGranted) {
      print('Notification permission not granted');
    }
  }


  Future<void> showLocalNotification(String message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      channelDescription: 'This channel is used for important notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails);

    try {
      await flutterLocalNotificationsPlugin.show(
        DateTime
            .now()
            .millisecondsSinceEpoch ~/ 1000, // unique id
        'New Message',
        message,
        platformDetails,
      );
    } catch (e) {
      print('Error showing notification: $e');
    }
  }

  // Future<void> scheduleDailyReminder() async {
  //   final now = tz.TZDateTime.now(tz.local);
  //   final scheduled = _nextInstanceOfTime(17, 20);
  //
  //   print('Now: $now');
  //   print('Scheduled for: $scheduled');
  //
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0,
  //     'Exercise Reminder',
  //     'Time for your daily exercise!',
  //     scheduled,
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'daily_reminder_channel',
  //         'Daily Reminder',
  //         channelDescription: 'Daily exercise reminder',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //       ),
  //     ),
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
  //     matchDateTimeComponents: DateTimeComponents.time, // ensures daily repeat
  //   );
  // }
  //
  // tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
  //   final now = tz.TZDateTime.now(tz.local);
  //   var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
  //   if (scheduled.isBefore(now)) {
  //     scheduled = scheduled.add(const Duration(days: 1));
  //   }
  //   return scheduled;
  // }

  Future<void> fetchAndNotify() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.124.134:3000/notification/doctor/${widget.patientId}?screen=reminder'),
      );


      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        List<String> newMessages = [];

        for (var notif in data) {
          final String msg = notif['message'];
          print('Checking message: $msg');
          // Remove the condition that checks for "newness"
          await showLocalNotification(msg);
          newMessages.add(msg);
          print('Message added: $msg');
        }

        if (newMessages.isNotEmpty) {
          await showLocalNotification(
              "You have ${newMessages.length} new notification(s)");

          setState(() {
            _messages.addAll(newMessages);
          });
        }
      } else {
        print('Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching notifications: $e');
    }


  }

}

extension on AndroidFlutterLocalNotificationsPlugin? {
  requestPermission() {}
}
