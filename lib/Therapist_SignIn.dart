import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forgot_password.dart';
import 'providers/auth_provider.dart';
import 'Therapist_SignUp.dart';
import 'Therapist_WelcomeAddPhoto.dart';
import 'package:hive/hive.dart';


class TherapistSignIn extends StatefulWidget {
  const TherapistSignIn({super.key});

  @override
  _TherapistSignInState createState() => _TherapistSignInState();
}

class _TherapistSignInState extends State<TherapistSignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  // Constants for colors
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // var patient = Email();
  //
  // void saveemail() {
  //   setState(() {
  //     patient.email = _emailController.text;
  //   });
  //
  //   print("Time: ${patient.email}");
  //
  //   slideRtL(
  //     setting_screen(
  //       email: patient.email,
  //     ),
  //   );
  // }
  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      final response = await http.post(
        Uri.parse('http://192.168.124.134:3000/doctor/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Login response: $responseData'); // Debug print

        String? username;
        String? token;

        // Extract username (your current logic)
        if (responseData.containsKey('username')) {
          username = responseData['username'];
        } else if (responseData.containsKey('user') && responseData['user'] is Map) {
          username = responseData['user']['username'];
        }

        // Extract token (adjust key according to your backend response)
        if (responseData.containsKey('token')) {
          token = responseData['token'];
        } else if (responseData.containsKey('accessToken')) {
          token = responseData['accessToken'];
        }


        var box = Hive.box('myBox');

        // Extract gender
        String? gender;
        if (responseData.containsKey('gender')) {
          gender = responseData['gender'];
        } else if (responseData.containsKey('user') && responseData['user'] is Map) {
          gender = responseData['user']['gender'];
        }

        if (gender != null && gender.isNotEmpty) {
          await box.put('gender', gender);
          print('Gender saved in Hive: $gender');
        } else {
          print('Gender not found in response');
        }


        if (username != null && username.isNotEmpty) {
          await box.put('username', username);
          print('Username saved in Hive: $username');
        } else {
          print('Username not found or empty in response');
        }
        if (email.isNotEmpty) {
          await box.put('email', email);
          print('Email saved in Hive: $email');
        } else {
          print('Email was empty, not saved');
        }

        if (token != null && token.isNotEmpty) {
          await box.put('token', token);
          print('Token saved in Hive: $token');
        } else {
          print('Token not found in response');
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign in successful!'),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacementNamed(context, '/Therapist_Home');


      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'] ?? 'Login failed';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }


  void _signInWithSocialMedia(String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign in with $provider successful!')),
    );

    // Navigate to home screen
    // Navigator.pushReplacementNamed(context, '/home');
  }

  Widget _socialSignInButton({
    required VoidCallback onPressed,
    required String iconPath,
    required Color backgroundColor,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.13;

    TextStyle labelStyle = TextStyle(
      color: _textColor,
      fontSize: 15,
    );

    return Scaffold(
      body: Stack(
          children: [
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
                  child: Image.asset("Assets/bigLogo.png")
              ),
            ),


            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.35),
                  child: Column(
                    children: [
                      // Title
                      Padding(
                        padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: _whiteColor,
                          ),
                        ),
                      ),

                      // Form
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            // Email field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:55,bottom: 5),
                                  child: Text("Email", style: labelStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                  child: TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: _textColor,
                                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),

                            // Password field
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:55,bottom: 5),
                                  child: Text("Password", style: labelStyle),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: _textColor,
                                      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                          color: _primaryColor,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),


                            // Forgot Password
                            Padding(
                              padding: EdgeInsets.only(left: horizontalPadding),
                              child: Align(
                                alignment: Alignment.centerLeft, // Changed from centerRight
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 5), // Changed padding
                                    minimumSize: Size.zero, // Allow the button to be smaller
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Minimize tap target
                                  ),
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: _whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            // Sign In button
                            ElevatedButton(

                              onPressed: _signIn,
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: screenWidth * 0.13,
                                ),
                                backgroundColor: _primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _whiteColor,
                                ),
                              ),
                            ),


                            const SizedBox(height: 10),

                            // Sign Up link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(
                                    color: _whiteColor,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TherapistSignUp (),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationColor: _whiteColor,
                                      color: _whiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // const SizedBox(height: 10),

                            // Or continue with divider
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: Divider(
                            //           color: _textColor,
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(horizontal: 10),
                            //         child: Text(
                            //           "Or continue with",
                            //           style: TextStyle(
                            //             color: _textColor,
                            //             fontSize: 14,
                            //           ),
                            //         ),
                            //       ),
                            //       Expanded(
                            //         child: Divider(
                            //           color: _textColor,
                            //           thickness: 1,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //
                            // const SizedBox(height: 10),

                            // Social sign in buttons
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       _socialSignInButton(
                            //         onPressed: () => _signInWithSocialMedia('Google'),
                            //         iconPath: 'assets/images/google.png',
                            //         backgroundColor: Colors.white,
                            //       ),
                            // _socialSignInButton(
                            //   onPressed: () => _signInWithSocialMedia('Facebook'),
                            //   iconPath: 'assets/images/facebook.png',
                            //   backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                            // ),
                            // _socialSignInButton(
                            //   onPressed: () => _signInWithSocialMedia('Apple'),
                            //   iconPath: 'assets/images/apple.png',
                            //   backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );

  }
}
