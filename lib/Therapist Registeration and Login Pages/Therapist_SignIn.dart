import 'package:flutter/material.dart';
import 'Therapist_SignUp.dart';

class TherapistSignInScreen extends StatelessWidget {
  const TherapistSignInScreen({super.key});

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
                image: AssetImage("Assets/background.png"), // First background
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Second background

          // Second background

          //sign in form
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 180),
                const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Montserrat",
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "      Email",
                    style: TextStyle(
                      color: Color(0xFFDAE7EB),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(
                  width: 320,
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

                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Passward",
                    style: TextStyle(
                      color: Color(0xFFDAE7EB),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                ),

                SizedBox(
                  width: 320,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFDAE7EB),
                      hintText: ".........",
                      hintStyle: TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xFF01709A),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Forgot your passward?",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Color(0xFF01709A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(47),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
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
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                          color: Color(0xFFFFFFFF),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
