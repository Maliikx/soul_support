import 'package:final_project/Patient%20Registeration%20and%20Login%20Pages/patient_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Patient%20Registeration%20and%20Login%20Pages/patient_sign_in.dart';

class PatientOptionsScreen extends StatelessWidget {
  const PatientOptionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Constants for colors
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
            padding: EdgeInsets.only(top: screenHeight * 0.60),
            child: Column(
              children: [
                const Text(
                    "Welcome!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  const Text(
                    "Sign In or Sign Up to continue.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: whiteColor,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                
                // Sign In
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
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
                          MaterialPageRoute(builder: (context) => const PatientSignInScreen()),
                        );
                      },
                      child: const Text(
                        "Sign In ",
                        style: TextStyle(color: primaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Sign up
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.13),
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
                          MaterialPageRoute(builder: (context) => const PatientSignUpScreen()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
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
