// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:soul_support/widgets/dock.dart';

class Aboutdoctor extends StatefulWidget {
  const Aboutdoctor({super.key});

  @override
  State<Aboutdoctor> createState() => _AboutdoctorState();
}

class _AboutdoctorState extends State<Aboutdoctor> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: screenWidth-30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Profile",
                  style: TextStyle(
                    color: Color(0xFF01709A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 30,),
              Text("Career Path",
                  style: TextStyle(
                    color: Color(0xFF01709A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
                      SizedBox(height: 30,),
              Text("HighLights",
                  style: TextStyle(
                    color: Color(0xFF01709A),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. .",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
      
              
            ]
          ),
    );
      }
}
