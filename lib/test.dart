import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screenWrapper.dart';
import 'package:flutter_application_2/transitions/custom_transitions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
// import 'package:soul_support/main.dart';
// import 'package:soul_support/screens/homeScreen.dart';
// import 'package:soul_support/screens/Setting%20and%20proffile%20screens/profile_screen.dart';
// import 'package:soul_support/screens/programScreen.dart';
// import 'package:soul_support/screens/Setting%20and%20proffile%20screens/setting_screen.dart';
// import 'package:soul_support/transitions/custom_transitions.dart';
// import 'package:soul_support/widgets/screenWrapper.dart';


import 'Therapist_Calender.dart';
import 'Therapist_Home.dart';
import 'Therapist_Settings.dart';


class DrawerScreen extends StatefulWidget {

  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}


class _DrawerScreenState extends State<DrawerScreen> {
  File? _profileImage;
  String? username;

  @override
  void initState() {
    super.initState();
    loadUsername();
    _loadProfileImage();
  }
  void _loadProfileImage() {
    var box = Hive.box('myBox');
    String? imagePath = box.get('profile_photo_path');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }
  void loadUsername() async {
    var box = Hive.box('myBox');
    String storedUsername = box.get('username', defaultValue: 'Guest');
    setState(() {
      username = storedUsername;
    });
  }


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 17,
            left: -214,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 720,
                height: 750,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 0, 140, 195),
                      const Color.fromARGB(0, 151, 202, 219)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 645,
            left: 190,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 340,
                height: 340,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 244, 223, 218),
                      const Color.fromARGB(0, 244, 223, 218)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 1],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            left: 25,
            top: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: _profileImage != null
                          ? ClipOval(
                        child: Image.file(
                          _profileImage!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      )
                          : const Image(
                        image: AssetImage("Assets/profilePicture.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    SizedBox(width: 10),  // Move inside Row here
                    Text(
                      "Hello $username ",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      fadeTransition(ScreenWrapper(child: const Therapist_Home())),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "Assets/homeIcon.svg",
                        width: 42,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      slideLtR(ScreenWrapper(child: const SchedulePage())),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/fi-br-calendar.png",
                        width: 42,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Calendar",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      slideLtR(ScreenWrapper(child: const setting_screen())),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "Assets/settingsIcon.svg",
                        width: 42,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 25,
            bottom: 80,
            child: GestureDetector(
              onTap: () async {
                // Clear the username from Hive
                var box = Hive.box('myBox');
                await box.delete('username');
                // Navigate to the login screen (adjust route name)
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    "Assets/logoutIcon.svg",
                    width: 35,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Log out",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}
