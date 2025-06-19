import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Calender.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Home.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Settings.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';



class TDrawerScreen extends StatefulWidget {

  const TDrawerScreen({super.key,});

  @override
  State<TDrawerScreen> createState() => _TDrawerScreenState();
}


class _TDrawerScreenState extends State<TDrawerScreen> {

  String? username;

  @override
  void initState() {
    super.initState();
    loadUsername();
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
      backgroundColor: primary,
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
                        gradient: LinearGradient(colors: [
                          const Color.fromARGB(255, 0, 140, 195),
                          const Color.fromARGB(0, 151, 202, 219)
                        ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 1],
                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                )
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
                        gradient: LinearGradient(colors: [
                          const Color.fromARGB(255, 244, 223, 218),
                          const Color.fromARGB(0, 244, 223, 218)
                        ],
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
              left: 25,
              top: 65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                      border: Border.all(color: Colors.white, width: 3)
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset("assets/imgs/doc2.jpeg",
                      fit: BoxFit.cover,
                      ),
                  ),
                ),
                      SizedBox(width: 10,),
                      Text("Hello $username ", style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),)
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          fadeTransition(
                              ScreenWrapper(isTherapist: true, child: const TherapistHome())));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/homeIcon.svg',
                          width: 42,
                          color: Colors.white,

                        ),
                        SizedBox(width: 20,),
                        Text("Home", style:
                        TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          slideLtR(ScreenWrapper(isTherapist: true, child: const TherapistCalender())));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/calendar.svg',
                          width: 42,
                          color: Colors.white,

                        ),
                        SizedBox(width: 20,),
                        Text("Calendar", style:
                        TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 25,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          slideLtR(ScreenWrapper(isTherapist: true, child: const Therapist_Settings())));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/settingsIcon.svg',
                          width: 42,
                          color: Colors.white,

                        ),
                        SizedBox(width: 20,),
                        Text("Settings", style:
                        TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),),
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

                  // Optionally clear any other data you want here

                  // Navigate to the login screen (change route name as needed)
                  Navigator.pushReplacementNamed(context, '/start');
                },
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/logoutIcon.svg',
                      width: 35,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5,),
                    Text("Log out",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }

}
