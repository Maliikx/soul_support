// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:soul_support/screens/therapistProfileScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class Cancelappointment extends StatefulWidget {
    final String doctor_name;
    final String imgPath;


  const Cancelappointment({
  required this.doctor_name,
  required this.imgPath,
    super.key});

  @override
  State<Cancelappointment> createState() => _CancelappointmentState();
}

class _CancelappointmentState extends State<Cancelappointment> {
  String? selectedReason;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 0),
                  child: Text("Choose the Reason for cancellation",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF01709A),
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0, top: 10),
                  child: Column(
                    children: [
                      buildRadioButton("Rescheduling"),
                      buildRadioButton("Internet Problem"),
                      buildRadioButton("Unexpected Work"),
                      buildRadioButton("Others"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("If Something Else",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF01709A),
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 383,
                  height: 129,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(30), // Apply rounded border
                    border:
                        Border.all(color: Colors.white, width: 1), // Add border
                  ),
                  child: TextField(
                    maxLines: 5,
                    minLines: 1,
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 12, 11),
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: "Write Your Reason Here...",
                      hintStyle:
                          TextStyle(color: Color(0xFF01709A).withOpacity(0.8)),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, "");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0889B9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    minimumSize: Size(250, 58),
                    elevation: 5, // Shadow depth
                    shadowColor: Colors.black.withOpacity(1),
                  ),
                  child: Text(
                    "Cancel Appointment",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      }

  

  Widget buildRadioButton(String value) {
    return RadioListTile<String>(
      title: Text(value,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      value: value,
      groupValue: selectedReason, // No default selection
      onChanged: (String? newValue) {
        setState(() {
          selectedReason = newValue;
        });
      },
      activeColor: Color(0xFF01709A), // Selected color
      tileColor: selectedReason == value
          ? Color(0xFF97CADB)
          : Colors.transparent, // Highlight selected tile
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    );
  }
}
