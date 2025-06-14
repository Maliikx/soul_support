import 'package:flutter/material.dart';
//import 'dock.dart';

void main() {
  runApp(const NotificationsApp());
}

class NotificationsApp extends StatelessWidget {
  const NotificationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/Therapist_Notification_image.png", // Correct asset path
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            top: 30, // المسافة من الأعلى
            left: 100,
            right: 0,
            child: Row(
              children: [
                Center(
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF01709A), // لون النص
                    ),
                  ),
                ),
                SizedBox(width: 70),
                Icon(Icons.close),
              ],
            ),
          ),
          const SizedBox(height: 100), // Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildCategoryHeader("Today"),
                    const SizedBox(width: 160),

                    _buildCategoryHeader("News"),
                  ],
                ),

                _buildNotificationCard(
                  "Scheduled Appointment",
                  "2 M",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
                _buildNotificationCard(
                  "Appointment Is Canceled",
                  "3 H",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  highlight: true,
                ),
                _buildNotificationCard(
                  "Sarah Rated You",
                  "2 M",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
                _buildCategoryHeader("Yesterday"),
                _buildNotificationCard(
                  "Scheduled Appointment",
                  "2 M",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
                _buildCategoryHeader("12 Dec"),
                _buildNotificationCard(
                  "Event Alert",
                  "2 M",
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55.0),
      child: Container(
        padding: const EdgeInsets.all(3),
        width: 80,
        decoration: BoxDecoration(
          color: const Color(0xFF97CADB),
          border: Border.all(color: const Color(0xFF97CADB)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Text
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Red Dot for New Notifications
            Positioned(
              right: 0, // Position the dot at the end of the text
              top: 5,
              child: Container(
                width: 10, // Size of the dot
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF01709A), // Red color for the dot
                  shape: BoxShape.circle, // Make it circular
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    String title,
    String time,
    String description, {
    bool highlight = false,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: highlight ? const Color(0xFFD9E7EC) : Colors.white,
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFF01709A),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Image(
                    image: AssetImage("assets/Vector(2).png"),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF01709A),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
