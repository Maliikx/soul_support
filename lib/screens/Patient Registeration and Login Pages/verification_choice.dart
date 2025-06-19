import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:soul_support/constants/constants.dart';
import 'dart:convert';
import 'email_verification.dart';
import 'phone_number_code.dart';

class VerificationChoiceScreen extends StatefulWidget {
  final String email;
  final String phoneNumber;
  final String name;
  final String password;
  final String gender;

  const VerificationChoiceScreen({
    super.key,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.password,
    required this.gender,
  });

  @override
  State<VerificationChoiceScreen> createState() =>
      _VerificationChoiceScreenState();
}

class _VerificationChoiceScreenState extends State<VerificationChoiceScreen> {
  bool isLoading = false;

  Future<void> sendOtpAndNavigate() async {
    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse("$baseUrl/patient/register");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "FirstName": widget.name,
          "PhoneNumber": widget.phoneNumber,
          "Gender": widget.gender,
          "email": widget.email,
          "password": widget.password,
        }),
      );

      final responseData = jsonDecode(response.body);
      print("Response Data: $responseData");

      //  Check if OTP was sent successfully
      if (response.statusCode == 201 || responseData['message'].toString().contains("OTP")) {
        print(" OTP Sent Successfully! Navigating...");

        if (!mounted) return;

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('OTP Sent Successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Future.delayed(const Duration(milliseconds: 500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(
                email: widget.email,
                verificationType: VerificationType.signup, // Correct
              ),
            ),
          );
        });
      } else {
        print(" OTP Sending Failed: ${responseData['message']}");
        showError(responseData['message'] ?? 'Failed to send OTP');
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print("API Call Error: $error");
      showError("Error: $error");
      setState(() {
        isLoading = false;
      });
    }
  }


  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              top: MediaQuery.of(context).size.height/2-150,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Verify Your Account",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            "Choose your preferred verification method",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          buildVerificationOption(
                            icon: Icons.email,
                            title: "Email Verification",
                            subtitle: "Verify through your email address",
                            onTap: () {
                              print(" Email verification button clicked!");
                              sendOtpAndNavigate();
                            },
                            isLoading: isLoading,
                          ),
          
                          // const SizedBox(height: 20),
                          // buildVerificationOption(
                          //   icon: Icons.phone_android,
                          //   title: "Phone Verification",
                          //   subtitle: "Verify through your phone number",
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) =>
                          //             PhoneVerificationCodeScreen(
                          //               phoneNumber: widget.phoneNumber,
                          //             ),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVerificationOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Colors.white.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF01709A),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01709A),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF01709A),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
