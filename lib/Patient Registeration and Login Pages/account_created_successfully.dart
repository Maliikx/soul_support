import 'package:flutter/material.dart';
import 'package:final_project/Patient%20Registeration%20and%20Login%20Pages/patient_sign_In.dart';
class AccountCreatedSuccessfully extends StatelessWidget {
  const AccountCreatedSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Constants for colors
    const Color primaryColor = Color(0xFF01709A);
    const Color whiteColor = Color(0xFFFFFFFF);
    const Color textColor = Color(0xFFDAE7EB);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/account-creation.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success icon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 70,
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Success message
                  const Text(
                    "Your account was successfully created!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Subtitle
                  const Text(
                    "Only one click to be better.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Sign in button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PatientSignInScreen()),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
