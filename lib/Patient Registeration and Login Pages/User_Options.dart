
import 'package:flutter/material.dart';
import '/Patient Registeration and Login Pages/Patient_Registeration_Options.dart';
import '/Patient Registeration and Login Pages/Therapist_Registeration_Options.dart';
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
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/options background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.65,),
            child: Column(
              children: [
                const Text(
                  "Are you a Patient or a Therapist ?",
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
                        );
                      },
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
