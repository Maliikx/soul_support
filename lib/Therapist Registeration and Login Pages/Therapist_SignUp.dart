import 'package:flutter/material.dart';
import '/Therapist Registeration and Login Pages/Therapist_Welcome.dart';
import 'Therapist_SignIn.dart';

void main() {
  runApp(const TherapistSignUpScreen());
}

class TherapistSignUpScreen extends StatelessWidget {
  const TherapistSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignUpScreen());
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // First background
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/background2.png"), // First background
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 35),

                  // Logo
                  const SizedBox(height: 120),

                  const Text(
                    "Sign Up As Therapist",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                    ),
                  ),
                  const SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "National ID",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Email",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "must be 8 characters",
                        hintStyle: TextStyle(
                          color: Color(0xFF01709A),
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF01709A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "repeat passward",
                        hintStyle: TextStyle(color: Color(0xFF01709A)),
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_outlined,
                          color: Color(0xFF01709A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage("Assets/Checkbox/on.png"),
                          width: 20,
                          height: 20,
                        ),
                        Text(
                          'I accept the terms and privacy policy',
                          style: TextStyle(
                            color: Color(0xFFDAE7EB),
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Welcome()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: screenWidth * 0.3,
                      ),
                      backgroundColor: Color(0xFF01709A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TherapistSignInScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFFFFFFF),
                            color: Color(0xFFFFFFFF),
                            fontFamily: "Montserrat",
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
