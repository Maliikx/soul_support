import 'package:flutter/material.dart';
import '/Patient Registeration and Login Pages/password_changed.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required String email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  
  // Constants for colors
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _resetPassword() {
  if (_formKey.currentState!.validate()) {
    // Navigate to password changed screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordChanged(),
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
                  image: AssetImage("assets/images/verification1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Back button
            Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: _whiteColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            
            // Content
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.25),
            child: Column(
            children: [
            // Title
            Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: _whiteColor,
              ),
            ),

                  
                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
                    child: Text(
                      "Please type something you'll remember",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: _whiteColor,
                      ),
                    ),
                  ),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // New Password field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60, bottom: 7),
                              child: Text(
                                "New Password",
                                style: TextStyle(
                                  color: _whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: TextFormField(
                                controller: _newPasswordController,
                                obscureText: _obscureNewPassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _textColor,
                                  hintText: "Enter new password",
                                  hintStyle: TextStyle(color: _primaryColor.withOpacity(0.7), fontSize: 14),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureNewPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: _primaryColor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureNewPassword = !_obscureNewPassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a new password';
                                  } else if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                        
                        // Confirm Password field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60, bottom: 5),
                              child: Text(
                                "Confirm New Password",
                                style: TextStyle(
                                  color: _whiteColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: _obscureConfirmPassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: _textColor,
                                  hintText: "Confirm your password",
                                  hintStyle: TextStyle(color: _primaryColor.withOpacity(0.7), fontSize: 14),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      color: _primaryColor,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword = !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  } else if (value != _newPasswordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                  
                        // Change Password button
                        ElevatedButton(
                            onPressed: _resetPassword,
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
                              'Change Password',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
