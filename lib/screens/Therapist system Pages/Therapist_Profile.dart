import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/data/todaysPatientsData.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/therapistName/tNamesrow.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/genderPieChart.dart';
import 'package:soul_support/widgets/patientStatisticsChart.dart';
import 'package:soul_support/widgets/todaysPatientsCard.dart';

class Therapist_Profile extends StatefulWidget {
  const Therapist_Profile({super.key});

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
   double screenWidth = MediaQuery.of(context).size.width;
   double screenHeight = MediaQuery.of(context).size.height;
   
    return  Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
              top: -15,
              left: 30,
              child: Transform.rotate(
                angle: 0.4,
                child: Container(
                  width: 720,
                  height: 750,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 1],
                      ),
                      shape: BoxShape.circle
                  ),
                ),
              )
          ),
          Positioned(
              top: 480,
              left: 300,
              child: Transform.rotate(
                angle: 0,
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)), // Rounds the corners

            child: Stack(
              children: [
         
                Container(
                  padding: EdgeInsets.only(top: 300,),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 30),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                          SizedBox(height: 30,),
                         Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: PatientStatisticsChart(),
                              ),
                        
                          SizedBox(height: 30,),
                              Container(
                                width: screenWidth-30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Today's Patients",
                                    style: TextStyle(
                                      color: primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    Text("Show All",
                                    
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: primary,
                                      color: primary,
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              SingleChildScrollView(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                scrollDirection: Axis.horizontal,
                                child:
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: 
                                   List.generate(todaysPatients.length, (i) => 
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 7.5), // Adjust spacing
                                  child: TodaysPatientsCard(
                                    name: todaysPatients[i]["name"]!,
                                    time: todaysPatients[i]["time"]!,
                                    description: todaysPatients[i]["description"]!,
                                    color: const Color.fromARGB(170, 255, 255, 255), 
                                    height: 100, 
                                    width: 200,
                                  )
                                 ),
                                ),
                                ),
                              ),
                               
                    
                      ],
                    ),
                  ),
                ),




              ],
            ),
          ),
       Container(//banner
                  height: 310,
                  width: double.infinity,
                  decoration: BoxDecoration(
                     boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(70),
                              spreadRadius: 0,
                              blurRadius: 4,

                              offset: Offset(0 , 4)
                          )],
                      color: primary,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
                  ),
                ),

                Positioned(//big circle
                  left: -135,
                  top: -135,
                  child: Container(
                    height: 400,
                    width: 400,

                    decoration: BoxDecoration(
                        color: bigCircle,
                        borderRadius: BorderRadiusDirectional.circular(350)


                    ),),
                ),
                Positioned(//heeader data
                top: 110,
                  child:  Container(
                    width: screenWidth,
                    child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(120),
                                          border: Border.all(color: Colors.white, width: 5)
                                        ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(120),
                                        child: _profileImage != null ? 
                                        Image.file(_profileImage!,
                                          fit: BoxFit.cover)
                                          : 
                                          Image.asset("assets/imgs/doc2.jpeg",
                                          fit: BoxFit.cover)
                                      ),
                                    ),
                                     Text(
                                     "Hello,Dr. $username",
                                          style: TextStyle(
                                            color: Color(0xffEBF4F7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                    // Text for greetings
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                       
                                        Text(
                                          "Have a productive day!",
                                          style: TextStyle(
                                            color: Color(0xffFFFFFF),
                                            fontSize: 16,
                                          ),
                                        ),
                                                 
                                      ],
                                    ),
                                  ],
                                ),
                                  Container(
                                  width: 150,
                                  height: 200,
                                  child: GenderPieChart(maleCount: 70, femaleCount: 30)),
                            
                              ],
                            ),
                          ),
                  ),
                       ),
                

          Exitbtn(),
        ],
      ),
    );

  }
}

class ProfileCard extends StatefulWidget {
  final void Function()? onTap;
  final String imgPath;
  final String name;

  const ProfileCard({
    super.key, 
    this.onTap, required this.imgPath, required this.name,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
     
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: const Color(0xffFFFFFF),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: 130,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 55,
              child: Image(image: AssetImage(
                widget.imgPath
                // "assets/imgs/emoticons.png"
                
                )),
            ),
            Text(
              widget.name,
              // "Mood Records",
              style: TextStyle(
                color: Color(0xff374957),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
