import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/homeScreen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/profile_screen.dart';
import 'package:soul_support/screens/programScreen.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/setting_screen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 0, 140, 195), const Color.fromARGB(0, 151, 202, 219)],
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset("assets/imgs/profilePicture.png",
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Hello Ahmed", style: TextStyle(
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
                    fadeTransition(ScreenWrapper(child: const HomeScreen())));
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
                    slideLtR(ScreenWrapper(child: const ProgramScreen())));
                  
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/programIcon.svg',
                      width: 42,
                      color: Colors.white,
                      
                      ),
                      SizedBox(width: 20,),
                      Text("My Program", style: 
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
                    slideLtR(ScreenWrapper(child: const setting_screen())));
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
                     color: Colors.white),)
              ],
            ))
        ],
      ),
    );
  }
}