
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/therapistProfileScreen.dart';
import 'package:soul_support/therapistName/names.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/availableTherapistsCard.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class TherapistScreen extends StatefulWidget {
  const TherapistScreen({super.key});

  @override
  State<TherapistScreen> createState() => _TherapistScreenState();
}

class _TherapistScreenState extends State<TherapistScreen> {
  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: -15,
                left: 30,
                child: Transform.rotate(
                  angle: 0.5,
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
                top: 650,
                left: -150,
                child: Transform.rotate(
                  angle: 0.6,
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
              left: 200,
              top: 50,
              child: Transform.rotate(
                angle: -0.4 ,
                child: SvgPicture.asset('assets/svg/therapistIcon.svg',
                  height: 300,
                  color: const Color.fromARGB(191, 255, 255, 255),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 200,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Need help from a professional?", style: TextStyle(
                        color: primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(130, 151, 202, 219),
                    child: Text("a therapist provides expert guidance and support that friends can't always offer. They help you understand your challenges and offer personalized solutions to improve your mental well-being. Taking that step is a sign of strength, not weakness. Invest in your mental health today—because you deserve it.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
        
        
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Meet", style: TextStyle(
                        color: primary,
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
        
                        SizedBox(height: 25,),
                        TherapistList(),
                        SizedBox(height: 25,),
        
                      ],
                    ),
                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
            Positioned(
                bottom: 30,
                child:
                Dock( currentIndex: 2,)),
          ],
        ),
      ),
    );
  }
}