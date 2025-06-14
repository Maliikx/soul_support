import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class TherapistProfile extends StatelessWidget {
  final Color primary = const Color(0xFF01709A);
  final Color smallCircle = const Color(0xFF97CADB);

  const TherapistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Therapist_Profile(primary: primary, smallCircle: smallCircle),
    );
  }
}

class Therapist_Profile extends StatefulWidget {
  final Color primary;
  final Color smallCircle;

  const Therapist_Profile({super.key, required this.primary, required this.smallCircle});

  @override
  State<Therapist_Profile> createState() => _Therapist_ProfileState();
}

class _Therapist_ProfileState extends State<Therapist_Profile> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Assets/Group 6878.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
                child: Stack(
                  children: [
                    // الخلفية الزرقاء
                    Container(
                      height: 270,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: widget.primary,
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(40),
          ),
        ),
      ),

                    // الدائرة الصغيرة
          Positioned(
                      left: -60,
                      top: -90,
            child: Container(
                        height: 300,
                        width: 300,
              decoration: BoxDecoration(
                          color: widget.smallCircle,
                          borderRadius: BorderRadiusDirectional.circular(200),
                        ),
                      ),
                    ),

                    // الصورة والنصوص
                     Positioned(
                      left: 20,
                      top: 25,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _profileImage != null
                                  ? ClipOval(
                                child: Image.file(
                                  _profileImage!,
                                  width: 138,
                                  height: 138,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : const Image(
                                image: AssetImage("Assets/Group 36754.png"),
                                width: 138,
                                height: 138,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Hello,Dr $username",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'You have a pretty busy week',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      top: 20,
                      child: Image(
                        image: AssetImage("Assets/fi-br-bell.png"),
                        width: 24,
                        height: 24,
                      ),
                    ),
                    // الصورة والنص فوقها
                    const Positioned(
                      right: 20,
                      top: 50,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage("Assets/Group 120.png"),
                                width: 100,
                                height: 100,
                              ),
                              Text(
                                "58.00%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          // النص تحت الصورة
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage("Assets/Ellipse 38.png"),
                                    width: 14,
                                    height: 14,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
            ),
          ),
      ],
                              ),
                              Row(
      children: [
                                  Image(
                                    image: AssetImage("Assets/Ellipse 39.png"),
                                    width: 14,
                                    height: 14,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                      color: Color(0xFF97CADB),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ), // مسافة بين الصورة والنص
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // الصورة الكبيرة
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.asset(
                    "Assets/Frame 9.png",
                    width: 396.55718994140625,
                    height: 266.393310546875,
                  ),
                ),
              ),

              // قسم المرضى
              Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    const Row(
                      children: [
                        Text(
                          'Your patients ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0889B9),
                          ),
                        ),
                        SizedBox(width: 150),
                        Text(
                          "Show All",
              style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF0889B9),
                fontWeight: FontWeight.bold,
                            color: Color(0xFF0889B9),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
              children: [
                          _buildPatientCard(
                            'Sarah Stone',
                            'Today, 08:00 - 09:00',
                          ),
                          const SizedBox(width: 10),
                          _buildPatientCard(
                            'Angela John',
                            'Today, 10:00 - 11:00',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة لبناء بطاقة المريض
  Widget _buildPatientCard(String name, String time) {
    return SizedBox(
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 3,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(fontSize: 16, color: Color(0xFF0889B9)),
          ),
          subtitle: Text(time),
        ),
      ),
    );
  }
}
