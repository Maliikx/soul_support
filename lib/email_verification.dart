import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Therapist_AccConfirmation.dart';
import 'Therapist_Welcome.dart';

enum VerificationType {
  signup,
  passwordReset,
  email,
}

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final VerificationType verificationType;

  const EmailVerificationScreen({
    super.key,
    required this.email,
    required this.verificationType,
  });

  @override
  State<EmailVerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<EmailVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  Timer? _timer;
  int _timeLeft = 60;
  bool _canResend = false;
  bool _isLoading = false;

  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    print('Verification type: ${widget.verificationType}');
    startTimer();
  }

  void startTimer() {
    _timeLeft = 60;
    _canResend = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> _resendCode() async {
    if (!_canResend) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse("http://10.0.2.2:3000/doctor/resend-otp");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": widget.email}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Raw Response Body: ${response.body}");

      setState(() {
        _isLoading = false;
        startTimer();
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Decoded Response: $responseData");

        bool success = responseData.containsKey('success') ? responseData['success'] ?? false : false;
        String message = responseData.containsKey('message') ? responseData['message'] : "Unexpected response from server.";

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(success ? 'Verification code sent to your email' : message),
              backgroundColor: success ? Colors.green : Colors.red),
        );
      } else {
        // Server returned error (HTML or something else)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
        print('Unexpected response body (not JSON): ${response.body}');
      }
    } catch (e) {
      print(" Exception: $e");
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _verifyCode() async {
    String code = _controllers.map((controller) => controller.text).join();
    if (code.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a 6-digit code."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse("http://10.0.2.2:3000/doctor/verify-otp");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": widget.email, "otp": code}),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Raw Response Body: ${response.body}");

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("Decoded Response: $responseData");

        String message = responseData['message']?.toString().toLowerCase() ?? "";

        if (responseData['success'] == true ||
            message.contains("user is verified") ||
            message.contains("can log in")) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Verification successful!"),
              backgroundColor: Colors.green,
            ),
          );

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()),
            );
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(responseData['message'] ?? "Verification failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // Server returned an error status (HTML or other)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Server error: ${response.statusCode}')),
        );
        print('Unexpected response body (not JSON): ${response.body}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Verification type: ${widget.verificationType}');

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Group 36731.png"),
              fit: BoxFit.fill
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.verificationType == VerificationType.signup
                      ? "Verify Your Account"
                      : "Please check your email",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.verificationType == VerificationType.signup
                      ? "Enter the verification code sent to\n${widget.email}"
                      : "We've sent a code to\n${widget.email}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                        (index) => SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        style: TextStyle(fontSize: 24, color: _primaryColor),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: _textColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 5) {
                            _focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            _focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _isLoading ? null : _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                    'Verify',
                    style: TextStyle(fontSize: 16, color: _whiteColor),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _canResend ? _resendCode : null,
                      child: Text(
                        'Send code again',
                        style: TextStyle(
                          color: _canResend ? _whiteColor : _whiteColor.withOpacity(0.5),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    if (!_canResend)
                      Text(
                        ' ($_timeLeft)',
                        style: TextStyle(color: _whiteColor),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
