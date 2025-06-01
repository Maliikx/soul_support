import 'package:flutter/material.dart';
import 'package:soul_support/screens/Patient%20Registeration%20and%20Login%20Pages/verification_choice.dart';
import 'patient_sign_in.dart';

class PatientSignUpScreen extends StatefulWidget {
  const PatientSignUpScreen({super.key});

  @override
  State<PatientSignUpScreen> createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final String _countryCode = '+20';
  String? _selectedGender;
  final List<String> _genderOptions = ['Male', 'Female'];


  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _acceptTerms = false;

  // Constants for colors
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
          child:

          Stack(
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
                  top: 190,
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
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.20),
                child: Column(
                  children: [
                    // Title
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 26,
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
                          // Name field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: horizontalPadding),
                                child: Text("Name", style: labelStyle),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: TextFormField(
                                  controller: _nameController,
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
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),

                          // Email field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: horizontalPadding),
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

                          // Phone field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: horizontalPadding),
                                child: Text("Phone Number", style: labelStyle),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: TextFormField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _textColor,
                                    prefixText: '$_countryCode ',
                                    prefixStyle: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your phone number';
                                    }

                                    // Remove any non-digit characters
                                    String phoneNumber = value.replaceAll(RegExp(r'[^\d]'), '');

                                    // Remove leading zero if present
                                    if (phoneNumber.startsWith('0')) {
                                      phoneNumber = phoneNumber.substring(1);
                                    }

                                    // Egyptian phone number validation (must start with 10, 11, 12, or 15 and be 10 digits)
                                    RegExp egyptianPhoneRegex = RegExp(r'^1[0125][0-9]{8}$');
                                    if (!egyptianPhoneRegex.hasMatch(phoneNumber)) {
                                      return 'Please enter a valid phone number';
                                    }

                                    return null;
                                  },
                                  onChanged: (value) {
                                    // Optional: Format the phone number as the user types
                                    if (value.startsWith('0')) {
                                      _phoneController.text = value.substring(1);
                                      _phoneController.selection = TextSelection.fromPosition(
                                        TextPosition(offset: _phoneController.text.length),
                                      );
                                    }
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
                                padding: EdgeInsets.only(left: horizontalPadding),
                                child: Text("Password", style: labelStyle),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "must be 8 characters",
                                    hintStyle: TextStyle(color: _primaryColor.withOpacity(0.6), fontSize: 14),
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
                                      return 'Please enter a password';
                                    } else if (value.length < 8) {
                                      return 'Password must be at least 8 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),

                          // Confirm Password field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: horizontalPadding),
                                child: Text("Confirm Password", style: labelStyle),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: _obscureConfirmText,
                                  decoration: InputDecoration(
                                    hintText: "repeat password",
                                    hintStyle: TextStyle(color: _primaryColor.withOpacity(0.6), fontSize: 14),
                                    filled: true,
                                    fillColor: _textColor,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureConfirmText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                        color: _primaryColor,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _obscureConfirmText = !_obscureConfirmText;
                                        });
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    } else if (value != _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                          // Gender field
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, bottom: 5),
                                  child: Text("Gender", style: labelStyle),
                                ),
                                DropdownButtonFormField<String>(
                                  value: _selectedGender,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: _textColor,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  items: _genderOptions.map((gender) {
                                    return DropdownMenuItem(
                                      value: gender,
                                      child: Text(gender),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedGender = value;
                                    });
                                  },
                                  validator: (value) => value == null ? 'Please select your gender' : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),


                          // Terms and Conditions checkbox
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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

                          // Sign Up Button
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                              child: SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Only proceed if the form is valid
                                        String fullPhoneNumber = _countryCode + _phoneController.text.replaceAll(RegExp(r'[^\d]'), '');

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => VerificationChoiceScreen(
                                              email: _emailController.text,
                                              phoneNumber: fullPhoneNumber,
                                              name: _nameController.text,
                                              password: _passwordController.text,
                                              gender: _selectedGender!,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _primaryColor, // Changed from 'primary' to 'backgroundColor'
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(fontSize: 18, color: _whiteColor),
                                      ),
                                    ),
                                  )
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





