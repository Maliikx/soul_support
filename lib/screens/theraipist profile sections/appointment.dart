// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soul_support/data/appoitmentDetails.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/ConfirmAppointment.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/timeContainer.dart';


class Appointment extends StatefulWidget {
  final String doctor_name;
    final String imgPath;

  
  const Appointment({
    required this.doctor_name,
    required this.imgPath,

    super.key});

  @override
  State<Appointment> createState() => _HorizontalMonthCalendarState();
}

class _HorizontalMonthCalendarState extends State<Appointment> {
  DateTime selectedDay = DateTime.now();
  DateTime startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);

  List<DateTime> generateMonthDays() {
    int daysInMonth = DateTime(startDate.year, startDate.month + 1, 0).day;
    return List.generate(daysInMonth,
        (index) => DateTime(startDate.year, startDate.month, index + 1));
  }

  void previousMonth() {
    setState(() {
      startDate = DateTime(startDate.year, startDate.month - 1, 1);
      selectedDay = startDate;
    });
  }

  void nextMonth() {
    setState(() {
      startDate = DateTime(startDate.year, startDate.month + 1, 1);
      selectedDay = startDate;
    });
  }

// container of time
  int? selectedIndex;
  String? selectedTime;
  List<String> times = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM"
  ];
  void selectContainer(int index) {
    setState(() {
      selectedIndex = index;
      selectedTime = times[index];
    });
  }

  //male and female
  String selectedGender = '';

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

// to save the appointment details
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController problemController = TextEditingController();

  var patient = AppoitmentDetails();

  void saveAppointment() {
    setState(() {
      patient.name = nameController.text;
      patient.age = int.tryParse(ageController.text) ?? 0;
      patient.gender = selectedGender;
      patient.date = DateFormat.yMMMd().format(selectedDay);
      patient.day = DateFormat.EEEE().format(selectedDay);
      patient.problem = problemController.text;
      patient.time =
          selectedIndex != null ? times[selectedIndex!] : "Not Selected";
    });

    print("Appointment Saved:");
    print("Name: ${patient.name}");
    print("Age: ${patient.age}");
    print("Gender: ${patient.gender}");
    print("Date: ${patient.date}");
    print("Day: ${patient.day}");
    print("Problem: ${patient.problem}");
    print("Time: ${patient.time}");
    Navigator.pushReplacement(
      context,

          slideRtL(
          Confirmappointment(
            Date: patient.date,
            Day: patient.day,
            Name: patient.name,
            Age: patient.age,
            Problem: patient.problem,
            Time: patient.time,
            Gender: patient.gender,
            doctor_name: widget.doctor_name,
            imgPath: widget.imgPath,
          ),
 ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
       double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<DateTime> days = generateMonthDays();

    return Scaffold(
      body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 60, bottom: 50),
                      height: screenHeight,
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text(
                              widget.doctor_name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // Container(
                          //   width: 500,
                          //   height: 170,
                          //   color: Color(0xFF97CADB),
                          // ),
                          Container(
                           color: Color(0xFF97CADB),//days
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        size: 14,
                                        color: Color(0xFF01709A),
                                      ),
                                      onPressed: previousMonth,
                                    ),
                                    Text(
                                      "${DateFormat.yMMMM().format(startDate)}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF01709A)),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 14,
                                        color: Color(0xFF01709A),
                                      ),
                                      onPressed: nextMonth,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 100,
                                  child: Container( 
                                    
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: days.length,
                                      itemBuilder: (context, index) {
                                        DateTime day = days[index];
                                        bool isSelected = day.day == selectedDay.day &&
                                            day.month == selectedDay.month &&
                                            day.year == selectedDay.year;
                                          
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedDay = day;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 15, top: 10, bottom: 10),
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: isSelected
                                                  ? Color(0xFF01709A)
                                                  : Colors.white,
                                              borderRadius: BorderRadius.circular(18),
                                              border:
                                                  Border.all(color: Colors.white, width: 1),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: 4),
                                                Text(
                                                  DateFormat.d().format(day), //date of day
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Color(0xFF589FBA),
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat.E().format(day), //day name
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Color(0xFF589FBA),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //================================================
                          //Available time
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Available Time  on ${DateFormat.yMMMd().format(selectedDay)}",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF01709A)),
                            ),
                          ),
                          Container( //grid                      
                            padding: const EdgeInsets.symmetric(horizontal: 15 ),
                            child: GridView.builder(
                              padding: EdgeInsets.only(top: 0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                    
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 7,
                                childAspectRatio: 3,
                              ),
                              itemCount: times.length,
                              itemBuilder: (context, index) {
                                return Timecontainer(
                                    time: times[index],
                                    isSelected: selectedIndex == index,
                                    onSelect: () => selectContainer(index),
                                  );
                                
                              },
                            ),
                          ),
                          Container(
                            width: screenWidth,
                            child: Center(
                              child: Container(
                                height: 2,
                                width: screenWidth-30,
                                color: Color(0xFF01709A),
                              ),
                            ),
                          ),
                          
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: screenWidth,
                            height: screenHeight*0.4,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Full Name",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF01709A),
                                        fontWeight: FontWeight.w600,
                                      )),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your name",
                                      hintStyle: TextStyle(color: Color(0xFF589FBA)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                    ),
                                  ),
                                  Text("Age",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF01709A),
                                        fontWeight: FontWeight.w600,
                                      )),
                                  TextField(
                                    controller: ageController,
                                    decoration: InputDecoration(
                                      hintText: "Enter Your Age",
                                      hintStyle: TextStyle(color: Color(0xFF589FBA)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(13),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 20),
                                    ),
                                  ),
                                  Text("Gender",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF01709A),
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () => selectGender("Female"),
                                        child: Container(
                                          height: 27.45,
                                          width: 90,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: selectedGender == "Female"
                                                ? Color(0xFF01709A)
                                                : Color(0xFFD6E8EE),
                                            borderRadius: BorderRadius.circular(18),
                                            border: Border.all(
                                              color: Color(0xFF01709A),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Female",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: selectedGender == "Female"
                                                    ? Colors.white
                                                    : Color(0xFF01709A),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                      GestureDetector(
                                        onTap: () => selectGender("Male"),
                                        child: Container(
                                          height: 27.45,
                                          width: 90,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: selectedGender == "Male"
                                                ? Color(0xFF01709A)
                                                : Color(0xFFD6E8EE),
                                            borderRadius: BorderRadius.circular(18),
                                            border: Border.all(
                                              color: Color(0xFF01709A),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Male",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: selectedGender == "Male"
                                                    ? Colors.white
                                                    : Color(0xFF01709A),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                  width: screenWidth,
                                  child: Center(
                                    child: Container(
                                      height: 2,
                                      width: screenWidth-30,
                                      color: Color(0xFF01709A),
                                    ),
                                  ),
                                ),
                                  Text("Describe your Problem",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF01709A),
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SingleChildScrollView(
                                    child: Container(
                                      height: 129,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFD6E8EE),
                                        borderRadius:
                                            BorderRadius.circular(30), // Apply rounded border
                                        border: Border.all(
                                            color: Colors.grey, width: 1), // Add border
                                      ),
                                      child: TextField(
                                        controller: problemController,
                                        maxLines: 5,
                                        minLines: 1,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 12, 12, 11),
                                          fontSize: 16,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Enter Your Problem here",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF01709A).withOpacity(0.8)),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 16),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          
                          Center(
                            child: ElevatedButton(
                              onPressed: saveAppointment,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0889B9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                minimumSize: Size(208, 58),
                                elevation: 5,
                                shadowColor: Colors.black.withOpacity(1),
                              ),
                              child: Text(
                                "Confirm Appointment",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Exitbtn()
                  ],
                ),
              ),
    );
      
  }
}
