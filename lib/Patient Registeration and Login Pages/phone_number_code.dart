import 'package:flutter/material.dart';
import 'dart:async';
import 'account_created_successfully.dart';

class PhoneVerificationCodeScreen extends StatefulWidget {
  final String phoneNumber;

  const PhoneVerificationCodeScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<PhoneVerificationCodeScreen> createState() =>
      _PhoneVerificationCodeScreenState();
}

class _PhoneVerificationCodeScreenState extends State<PhoneVerificationCodeScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  Timer? _timer;
  int _timeLeft = 20;
  bool _canResend = false;
  final Color _primaryColor = const Color(0xFF01709A);
  final Color _textColor = const Color(0xFFDAE7EB);
  final Color _whiteColor = const Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timeLeft = 20;
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

  void _verifyCode() {
  String code = _controllers.map((controller) => controller.text).join();
  if (code.length == 4) {
    if (code == "1234") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification Successful'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AccountCreatedSuccessfully(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid verification code'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      
      for (var controller in _controllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter complete verification code'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }
}


  void _resendCode() {
    if (_canResend) {
      startTimer();
      for (var controller in _controllers) {
        controller.clear();
      }
      _focusNodes[0].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/verification1.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Phone Verification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter the code sent to\n${widget.phoneNumber}",
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
                    4,
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
                          if (value.isNotEmpty && index < 3) {
                            _focusNodes[index + 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: SizedBox(
                    width: 120,
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: _whiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _canResend ? _resendCode : null,
                      child: Text(
                        'Resend Code',
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
