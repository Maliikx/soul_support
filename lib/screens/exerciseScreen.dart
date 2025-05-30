import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/musicScreen.dart';
import 'package:soul_support/screens/programScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/exerciseBanner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:soul_support/widgets/screenWrapper.dart';


class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
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
            Positioned(
            left: 170,
            top: 30,
            child: Transform.rotate(
              angle: -0.5 ,
              child: SvgPicture.asset('assets/svg/exerciseIcon.svg',
              height: 400,
              color: const Color.fromARGB(191, 255, 255, 255),
              ),
            ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 150),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Exercises list",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: primary
                      ),),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          slideRtL(ScreenWrapper(child:  MusicScreen())),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                        color: const Color.fromARGB(199, 1, 99, 135),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Harmonic Sound Therapy",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            
                            ),
                            ),
                            Text("a therapeutic practice that uses sound waves, vibrations, and frequencies to promote relaxation, reduce stress, and improve overall well-being.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                            
                      
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Container(
                                      width: double.infinity,
                                      child: CarouselSlider(
                                        items: [
                                          Image.asset("assets/imgs/sound1.jpeg",
                                          width: 300,
                                          fit: BoxFit.cover,
                                          ),
                                          Image.asset("assets/imgs/sound2.jpeg",
                                          width: 300,
                                          fit: BoxFit.cover,
                                          ),
                                          Image.asset("assets/imgs/sound3.jpeg",
                                          width: 300,
                                          fit: BoxFit.cover,
                                          )
                                        ], options: CarouselOptions(
                                          height: 200,
                                          autoPlay: true,
                                          
                      
                                          autoPlayInterval: Duration(milliseconds: 4000),
                                          viewportFraction: 0.5,
                                        )),
                                    ),
                                  ),
                                ),
                                  Container(
                                  height: 50,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Check playlist",
                                      style: TextStyle(
                                        color: primary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Icon(Icons.play_circle_filled_rounded,
                                       color: primary,
                                       size: 35,
                                       )
                                    ],
                                  ),
                                ),
                          ],
                        ),
                        
                      ),
                    ),
                    SizedBox(height: 30,),
                    ExerciseBanner(title: "Meditation 101",
                    description: "Techniques, Benefits, and a Beginner’s How-To",
                    imgPath: "assets/imgs/meditation1.png",
                    ),
                    SizedBox(height: 30,),
                    ExerciseBanner(title: "Cardio Meditation",
                     description: "Basics of Yoga for Beginners or Experienced Professionals",
                      imgPath: "assets/imgs/meditation2.png")
              
                  ],
                ),
              ),
            ),



          Positioned(
            bottom: 30,
            child: Dock( currentIndex: 3,)
            )
        ],
      )
    );
  }
}