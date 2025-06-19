
import 'package:flutter/material.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/Patient_Registeration_Options.dart';
import 'package:soul_support/screens/Therapist%20system%20Pages/Therapist_Registeration_Options.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';
class UserOptions extends StatelessWidget {
  const UserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    
    const Color primaryColor = Color(0xFF01709A);
    const Color whiteColor = Color(0xFFFFFFFF);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
              top: -450,
              left: 60,
              child: Transform.rotate(
                angle: -0.2,
                child: Container(
                  width: 720,
                  height: 750,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         stops: [0.5, 1],
                         ),
                          shape: BoxShape.circle
                              ),
                        ),
              )
              ),
               Positioned(
              top: 570,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 900,
                decoration: BoxDecoration(
                              color: Color(0xff67A7BE),
                              borderRadius: BorderRadius.circular(120),
                              boxShadow: [BoxShadow(color: Color.fromARGB(148, 133, 186, 206),
                           spreadRadius: 30,
                           blurRadius: 0,
                           offset: Offset(0 , 4)
                           )],
                              ),
                              
                        ),
              )
              ),
              Positioned(
                top: screenHeight*0.2,
                left: 10,
                child: Container(
                height: 250,
                child: Image.asset("assets/logos/bigLogo.png"))),
          
          // Content
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.65,),
            child: Column(
              children: [
                const Text(
                  "Are you a patient or a therapist?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: whiteColor
                  )
                ),
                const SizedBox(height: 40),
                
                // Sign up as patient button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PatientOptionsScreen()),
                        );
                      },
                      child: const Text(
                        "Patient",
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Sign up as doctor button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TherapistOptionsScreen()),
                        );},
                      child: const Text(
                        "Therapist",
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                
                
              

              ],
            ),
          ),
        ],
      ),
    );
  }
}
