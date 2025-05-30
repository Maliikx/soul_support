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
                left: 30,
              top: 325,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width+100,
                  height: 900,
                decoration: BoxDecoration(
                              color: Color(0xff67A7BE),
                              borderRadius: BorderRadius.circular(120),
                              boxShadow: [BoxShadow(color: Color.fromARGB(148, 133, 186, 206),
                           spreadRadius: 30,
                           blurRadius: 0,
                           offset: Offset(0 ,0)
                           )],
                              ),
                              
                        ),
              )
              ),
              Positioned(
                top: screenHeight*0.08,
                left: 60,
                child: Container(
                height: 180,
                child: Image.asset("assets/logos/bigLogo.png")
                ),
                ),
          // Second background

          // Second background

          //sign in form
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.13),
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
                      "Email",
                      style: TextStyle(
                        color: Color(0xFFDAE7EB),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      ),
                    ),
                  ),
              
                  SizedBox(
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
                      "Passward",
                      style: TextStyle(
                        color: Color(0xFFDAE7EB),
                        fontFamily: "Montserrat",
                        fontSize: 16,
                      ),
                    ),
                  ),
              
                  SizedBox(
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
                      "Forgot your passward?",
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
          ),
        ],
      ),
    );
  }
}
