import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/data/music_data.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'dart:math';

import 'package:soul_support/widgets/musicCard.dart';


class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Stack(
        children: [
           Positioned(
                child: ClipPath(
                  clipper: SCurveClipper(),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(colors: [
                       primary,
                       accent,
                       ],
                         
                         stops: [0, 1],
                         ),
                    ),
                  ),
                ),
              ),
          Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),),
                    Text("\"Let the rhythm of the music quiet your thoughts, the melody soothe your soul, and the harmony remind you that healing is always within reach.\"",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                    ),
                    ),
                  ],
                ),
                
              ),
              // SizedBox(height: 0,),
              CarouselSlider(
                items: List.generate(musicDetails.length, (i) => 
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20), // Adjust spacing
                                child: MusicCard(
                                  title: musicDetails[i]["title"]!,
                                  description : musicDetails[i]["description"]!,
                                  duration : musicDetails[i]["duration"]!,
                                  imgPath: musicDetails[i]["imgPath"]!,
                                )
                              ),
            
                              ),

                 options: CarouselOptions(
                  height: MediaQuery.of(context).size.height*0.58,
                  viewportFraction: 0.8,
                  enableInfiniteScroll: false
                  
                ))
             
            ],
          ),



          
               Exitbtn()
        ],
      ),
    );
  }
}

class SCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path(); // top left
    path.lineTo(0, h); //bottom left
    path.lineTo(
  size.width * 0.0,    // Control X (0.0%)
  size.height * 0.5,  // Control Y (43%)
    // End Y (57%)
);

// Second quadratic curve
path.quadraticBezierTo(
  0,    // Control X (0.0%)
  size.height * 0.7,  // Control Y (71%)
  size.width*0.3,   // End X (17%)
  size.height * 0.70,  // End Y (72%)
);

// Third quadratic curve
path.lineTo(
  size.width * 0.7,
  size.height * 0.70   // Control X (67%)
  
    // End Y (71%)
);

// Fourth quadratic curve
path.quadraticBezierTo(
  size.width * 1,    // Control X (100%)
  size.height * 0.7,  // Control Y (72%)
  size.width,          // End X (100%)
  size.height*0.85 ,  // End Y (85%)
);
    path.lineTo(w, 0); // top right
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}