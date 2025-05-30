// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      width: screenWidth-30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            
                      children: [
                          Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xFFD8E7ED), width: 5), // White border
                              ),
                            ),
                            SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                         child: Text("He helped me so much, So professional", style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 12,
                                           fontWeight: FontWeight.w500)),
                                                                      ),
                                      Text("Ken Adams", style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                          ],
                                  ),
                        SingleChildScrollView(
                          child: Container(
                                          width: 383,
                                          height: 129,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD6E8EE),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: TextField(
                                            expands: true,
                                            maxLines: null,
                                            minLines: null,
                                            style: TextStyle(
                                              color:  Color.fromARGB(255, 12, 12, 11),
                                              fontSize: 16
                                            ),
                                            decoration: InputDecoration(
                                              hintText: "Add Review",
                                              hintStyle: TextStyle(color: Colors.black),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              border: InputBorder.none,
                                               contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16), 
                                            ),
                                          ),
                                       
                                    
                                        ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          //  Navigator.pushNamed(context, "Appointment");
                        
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0889B9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            minimumSize: Size(80, 24),
                            elevation: 5, // Shadow depth
                            shadowColor: Colors.black.withOpacity(1),
                          ),
                          child: Text(
                            "Add review",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
          
                    
                      ],
                      
                    ),
        ),
      ),
    );
          
  }
}
