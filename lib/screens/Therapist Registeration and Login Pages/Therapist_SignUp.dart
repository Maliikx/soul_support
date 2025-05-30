import 'package:flutter/material.dart';
import 'package:soul_support/screens/Therapist%20Registeration%20and%20Login%20Pages/Therapist_Welcome.dart';
import 'Therapist_SignIn.dart';

void main() {
  runApp(const TherapistSignUpScreen());
}

class TherapistSignUpScreen extends StatefulWidget {
  const TherapistSignUpScreen({super.key});

  @override
  State<TherapistSignUpScreen> createState() => _TherapistSignUpScreenState();
}

class _TherapistSignUpScreenState extends State<TherapistSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignUpScreen());
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
     bool _obscureText = true;
      bool _obscureConfirmText = true;
      bool _acceptTerms = false;

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
              top: 140,
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
                top: screenHeight*0.045,
                left: 125,
                child: Container(
                height: 110,
                child: Image.asset("assets/logos/bigLogo.png")
                ),
                ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
            
                    // Logo
                    const SizedBox(height: 100),
            
                    const Text(
                      "Sign Up As Therapist",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                        fontFamily: "Montserrat",
                      ),
                    ),
                    const SizedBox(height: 10),
            
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
                      child: Container(
                            child: Row(
                              children: [
                                Checkbox(
                                  value: _acceptTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      _acceptTerms = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  "I accept the terms and conditions",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF013A4F),
                                  ),
                                ),
                              ],
                            ),
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
          ),
        ],
      ),
    );
  }
}
