import 'package:flutter/material.dart';

import 'forgot_password.dart';
import 'patient_sign_up.dart';

class PatientSignInScreen extends StatefulWidget {
  const PatientSignInScreen({super.key});

  @override
  State<PatientSignInScreen> createState() => _PatientSignInScreenState();
}

class _PatientSignInScreenState extends State<PatientSignInScreen> {
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

  void _signIn() {
  if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign in successful!')),
    );
    
    // Navigate to home screen
    // Navigator.pushReplacementNamed(context, '/home');
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
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
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
                              builder: (context) => const PatientSignUpScreen(),
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
                  const SizedBox(height: 10),
                  
                  // Or continue with divider
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: _textColor,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              color: _textColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: _textColor,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 10),
                  
                  // Social sign in buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Google'),
                          iconPath: 'assets/images/google.png',
                          backgroundColor: Colors.white,
                        ),
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Facebook'),
                          iconPath: 'assets/images/facebook.png',
                          backgroundColor: const Color.fromARGB(255, 231, 231, 231),
                        ),
                        _socialSignInButton(
                          onPressed: () => _signInWithSocialMedia('Apple'),
                          iconPath: 'assets/images/apple.png',
                          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ]
          ),
        ),
      ),
      ),
      ),
    );
  }
}
