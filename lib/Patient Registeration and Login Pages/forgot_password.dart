import 'package:flutter/material.dart';
import '/Patient Registeration and Login Pages/email_verification.dart';
import 'patient_sign_in.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  
  // Constants for colors
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendCode() {
    if (_formKey.currentState!.validate()) {
      // Navigate to verification screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EmailVerificationScreen(
            email: _emailController.text,
            verificationType: VerificationType.passwordReset,
          ),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalPadding = screenWidth * 0.13;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background image
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/verification2.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.26),
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: _whiteColor,
                      ),
                    ),
                  ),
                  
                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
                    child: Text(
                      "Don't worry! It happens. Please enter the email associated with your account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: _whiteColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                              padding: const EdgeInsets.only(left: 60, bottom: 5),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  color: _whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _textColor,
                                  hintText: "Enter your email address",
                                  hintStyle: TextStyle(color: _primaryColor.withOpacity(0.7), fontSize: 14),
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
                            const SizedBox(height: 40),
                          ],
                        ),
                        // Send Code button
                        ElevatedButton(
                          onPressed: _sendCode,
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
                            'Send Code',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Remember Password link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Remember Password?',
                        style: TextStyle(
                          color: _whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PatientSignInScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                        ),
                        child: Text(
                          'Login',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


