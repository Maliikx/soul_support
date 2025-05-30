// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/aboutDoctor.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/chat.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/review.dart';
import 'package:soul_support/screens/theraipist%20profile%20sections/schedule.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/doctorSwitchStatment.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class TherapistProfile extends StatefulWidget {
  final String name;
  final String imgPath;
  const TherapistProfile({
    required this.name,
    required this.imgPath,
    super.key});

  @override
  State<TherapistProfile> createState() => TherapistProfileState();
}

class TherapistProfileState extends State<TherapistProfile> {
  var _border0 =BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(32), // Rounded corners
                border:Border.all(color: Color(0xFF97CADB), width: 6), );
  var _border1 = BoxDecoration();
  var _border2 = BoxDecoration();
  
  final PageController _pageController = PageController();
  int _currentPage = 0;
  void _schedule() {
      setState(() {
        _currentPage = 0;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    
  }
  void _about() {
      setState(() {
        _currentPage = 1;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    
  }
   void _aboutDoc() {
      setState(() {
        _currentPage = 1;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    
  }
  void _review() {
      setState(() {
        _currentPage = 2;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    
  }
  
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return  Scaffold(
              body: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                            child: Container(
                            color: accent,
                            height: 400,
                            width: double.infinity,
                            )),
                            Positioned(
                              top: 150,
                              child: Container(
                                width: screenWidth,
                                height: screenWidth,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color.fromARGB(134, 8, 138, 185), const Color.fromARGB(0, 151, 202, 219)],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.1, 0.7],
                                              ),
                                                shape: BoxShape.circle
                                                    ),
                                              )
                              ),
                              Positioned(
                                top: 240,
                                child: Container(
                                width: 230,
                                height: 230,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary
                                ),
                                child: Transform.translate(
                                  offset: Offset(0, -60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(widget.name,style: TextStyle(
                                                        color: Color(0xFFFFFFFF),
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),),
                                      Text("Therapist",style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 14,
                                      
                                      ),),
                                    ],
                                  ),
                                ),
                              )
                              ),
                
                  
                                Positioned(
                                  top: 50,

                                  child: Text(
                                          "Therapist Profile",
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                              ),
                                ),
                  Container(
                    width: screenWidth,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {}, //video call
                            child: Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(217, 255, 255, 255),
                                  shape: BoxShape.circle
                              ),
                              child: SvgPicture.asset("assets/svg/video.svg",color: primary,))
                              ),
                            SizedBox(
                              height: 10,
                            ),
                        GestureDetector(
                           onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Chat(
                                    senderRole: 'doctor',
                                  )),
                          (route) => false,
                        );
                      },//chat with doctor
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                  color: const Color.fromARGB(217, 255, 255, 255),
                                  shape: BoxShape.circle
                              ),
                            child: Icon(Icons.message, color: primary, size: 32,)))
                      ],
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Color(0xff5093BA), width: 5)
                      ),
                      child: ClipRRect
                    (
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(widget.imgPath,fit: BoxFit.cover,alignment: Alignment(0.4,0), ))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight*0.35),
                    padding: EdgeInsets.only(top: 15,  ),
                    width: screenWidth,
                    height: screenHeight*0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: background
                    ),
                    
                    child: Column(
                      children: [
                       Container(
                        width: screenWidth-30,
                        child: Card(
                          
                          color: Color(0XFFFFFFFF).withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                 setState(() {
                                    if(_border0 != BoxDecoration() && _currentPage !=0){

                                    _border0 = BoxDecoration();
                                    }
                                    else{
                                       _border0 = BoxDecoration(
                                        color: Colors.white, // Background color
                                        borderRadius: BorderRadius.circular(32), // Rounded corners
                                        border:Border.all(color: Color(0xFF97CADB), width: 6), );
                                         _border2 = BoxDecoration();
                                         _border1 = BoxDecoration();
                                         _schedule();
                                    }
                                  });
                                },
                                child: Container(
                                  width: 112.5,
                                  height: 68,
                                 decoration: _border0,
                                  child: Center(
                                    child: Text("Schedule",
                                        style: TextStyle(
                                          color: Color(0xFF01709A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                ),
                              ),
                              
                              GestureDetector(
                                onTap: () {
                                   setState(() {
                                    if(_border1 != BoxDecoration() && _currentPage !=1){

                                    _border1 = BoxDecoration();
                                    }
                                    else{
                                       _border1 = BoxDecoration(
                                        color: Colors.white, // Background color
                                        borderRadius: BorderRadius.circular(32), // Rounded corners
                                        border:Border.all(color: Color(0xFF97CADB), width: 6), );
                                         _border2 = BoxDecoration();
                                         _border0 = BoxDecoration();
                                         _aboutDoc();
                                    }
                                  });
                                },
                                child: Container(
                                  width: 134,
                                  height: 68,
                                  decoration: _border1,
                                  child: Center(
                                    child: Text(
                                      "About Doctor",
                                      style: TextStyle(
                                        color: Color(0xFF01709A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              
                              GestureDetector(
                                onTap: () {
                                   setState(() {
                                    if(_border2 != BoxDecoration() && _currentPage !=2){

                                    _border2 = BoxDecoration();
                                    }
                                    else{
                                       _border2 = BoxDecoration(
                                        color: Colors.white, // Background color
                                        borderRadius: BorderRadius.circular(32), // Rounded corners
                                        border:Border.all(color: Color(0xFF97CADB), width: 6), );
                                         _border0 = BoxDecoration();
                                         _border1 = BoxDecoration();
                                         _review();
                                    }
                                  });
                                  

                                  
                                },
                                child: Container(
                                  width: 112.5,
                                height: 68,
                                   decoration:_border2,
                                  child: Center(
                                    child: Text("Review",
                                        style: TextStyle(
                                          color: Color(0xFF01709A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          )),
                      ),
                        SizedBox(height: 15,),
                        Container(
                          height: 400,
                          child: PageView(
                            controller: _pageController,
                            physics: NeverScrollableScrollPhysics(),
                            children:[ 
                            Schedule(doctor_name: widget.name, imgPath: widget.imgPath,),
                            Aboutdoctor(),
                            Review(),
                            
                            ]
                          ),
                        ),
                      ],
                    )),
                  
                Positioned(
                  bottom: 30,
                  child: Dock(currentIndex: 2)),
                Exitbtn()       
                ],
              )
          );
        }
       
  }

