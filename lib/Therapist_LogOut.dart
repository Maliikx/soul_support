import 'package:flutter/material.dart';

void main() {
  runApp(const TherapistSettings());
}

class TherapistSettings extends StatelessWidget {
  const TherapistSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TherapistSettingsScreen(),
    );
  }
}

class TherapistSettingsScreen extends StatelessWidget {
  static const Color primary = Color(0xFF01709A);
  static const Color smallCircle = Color(0xFF97CADB);
  static const Color backgroundColor = Color(0xFFD6E8EE);

  const TherapistSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeader(), _buildSettingsList(context)],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)),
      child: Stack(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            ),
          ),
          Positioned(
            left: -50,
            top: -90,
            child: Container(
              height: 400,
              width: 300,
              decoration: const BoxDecoration(
                color: smallCircle,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Image(
                  image: AssetImage("Assets/Group 36754.png"),
                  width: 100,
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ethar Ayman',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEBF4F7),
                      ),
                    ),
                    Text(
                      'Etho@gmail.com',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Settings and privacy"),
          _buildListTile("Edit Profile", "assets/fi-br-user.png", () {}),
          _buildListTile(
            "Security",
            "assets/fi-br-shield-exclamation.png",
            () {},
          ),
          _buildNotificationTile(),
          _buildListTile("Password Manager", "assets/fi-br-user.png", () {}),
          _buildListTile("Calendar", "assets/fi-br-lock.png", () {}),
          _buildSectionTitle("Support & About"),
          _buildListTile("Who are we", "assets/Group(1).png", () {}),
          _buildListTile(
            "Help & Support",
            "assets/fi-br-shield-interrogation.png",
            () {},
          ),
          _buildListTile(
            "Terms and Policies",
            "assets/fi-br-shield-exclamation.png",
            () {},
          ),
          _buildSectionTitle("Account"),
          _buildListTile("Delete Account", "assets/fi-br-trash.png", () {}),
          Center(
            child: ElevatedButton(
              onPressed: () => _showLogoutDialog(context),
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF374957),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String iconPath, VoidCallback onTap) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: const Color(0xFF374957),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFF374957), fontSize: 16),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black54,
      ),
      onTap: onTap,
    );
  }

  Widget _buildNotificationTile() {
    return ListTile(
      leading: Image.asset(
        "assets/fi-br-bell-ring.png",
        width: 24,
        height: 24,
        color: const Color(0xFF374957),
      ),
      title: const Text(
        "Notification",
        style: TextStyle(color: Color(0xFF374957), fontSize: 16),
      ),
      trailing: Switch(
        value: true,
        onChanged: (bool value) {},
        activeTrackColor: primary,
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Logout", textAlign: TextAlign.center),
          content: const Text(
            "Are you sure you want to log out?",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Yes, Logout")),
          ],
        ),
  );
}
