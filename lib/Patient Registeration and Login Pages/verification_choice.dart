import 'package:flutter/material.dart';
import 'email_verification.dart';
import 'phone_number_code.dart';

class VerificationChoiceScreen extends StatelessWidget {
  final String email;
  final String phoneNumber;
  final String name;

  const VerificationChoiceScreen({
    super.key,
    required this.email,
    required this.phoneNumber,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/account-creation.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0,),
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
                    padding: const EdgeInsets.symmetric(horizontal: 30,),
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
                        _buildVerificationOption(
                          context: context,
                          icon: Icons.email,
                          title: "Email Verification",
                          subtitle: "Verify through your email address",
                          onTap: () {
                            
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailVerificationScreen(
                                email: email,
                                verificationType: VerificationType.signup,
                              ),
                            ),
                          );

                          },
                        ),
                        const SizedBox(height: 20),
                        _buildVerificationOption(
                          context: context,
                          icon: Icons.phone_android,
                          title: "Phone Verification",
                          subtitle: "Verify through your phone number",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhoneVerificationCodeScreen(
                                  phoneNumber: phoneNumber,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
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
                const Icon(
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
