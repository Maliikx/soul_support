// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/Appointment.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/hoursContainer.dart';


class Schedule extends StatefulWidget {
    final String doctor_name;
    final String imgPath;


  const Schedule({
    required this.doctor_name,
    required this.imgPath,
    super.key});

  @override
  State<Schedule> createState() => ScheduleState();
}

class ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
           
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text("September ,2025",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  Text("Monday - Friday, 08:00-15:00,",
                      style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)), //change every month
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      hoursContainer(Date: "Tue 18"),
                      
                      hoursContainer(Date: "Wed 19"),
                      
                      hoursContainer(Date: "Thu 20"),
                     
                      hoursContainer(Date: "Fri 21"),
                      
                    ],
                  ),
                  Text("Hours Available",
                      style: TextStyle(
                          color: primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  Text(
                      "*Apart from these hours, the doctor’s response will be slow ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      hoursContainer(Date: "08:00"),
                     
                      hoursContainer(Date: "09:00"),
                     
                      hoursContainer(Date: "10:00"),
                     
                      hoursContainer(Date: "11:00"),
                      
                    ],
                  ),
                  Container(
                    width: screenWidth,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, slideBtT(Appointment(doctor_name: widget.doctor_name, imgPath: widget.imgPath,)));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0889B9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          minimumSize: Size(208, 58),
                          elevation: 5, // Shadow depth
                          shadowColor: Colors.black.withOpacity(1),
                        ),
                        child: Text(
                          "Appointment",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                 
                  
                ],
              ),
            ),
          );
  }     
  }