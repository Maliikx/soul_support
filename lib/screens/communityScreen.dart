import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/constants/constants.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class CommunityScreen extends StatefulWidget {
  final int patientId;

  const CommunityScreen({super.key, required this.patientId});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<String> _messages = [];

  @override
  void initState() {
    super.initState();
    initializeNotifications().then((_) {
      createNotificationChannel();
      // scheduleDailyReminder();
      fetchAndNotify(); // Fetch once on start

      //Re-fetch every 30 seconds
      Timer.periodic(const Duration(hours: 200), (timer) {
        fetchAndNotify();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100,),
                  Text("Community",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),),


                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.80,
                    child: _messages.isEmpty
                        ? const Center(child: Text('No upcoming events'))
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
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(child: SvgPicture.asset("assets/svg/schedule.svg")),
                    //       Text("No Upcoming Event",
                    //       style: TextStyle(
                    //         fontSize: 25,
                    //         fontWeight: FontWeight.bold
                    //       ),),
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 20),
                    //         child: Text("We will notify you with the upcoming events soon.",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.w300,
                    //           color: primary
                    //         ),),
                    //       )
                    //     ],
                    //   ),
                    // ),

                  )],
              ),
            ),


            Exitbtn()
          ],
        ),
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


  Future<void> fetchAndNotify() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/notification/patient/${widget.patientId}?screen=event'),
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

