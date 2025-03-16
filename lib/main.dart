import 'package:flutter/material.dart';
// import '/Patient Registeration and Login Pages/patient_sign_in.dart';
// import '/Patient Registeration and Login Pages/patient_sign_up.dart';
import 'Patient Registeration and Login Pages/User_Options.dart';
// import '/Patient Registeration and Login Pages/account_created_successfully.dart';
// import '/Patient Registeration and Login Pages/password_changed.dart';
// import 'Patient Registeration and Login Pages/welcome.dart';
// import 'Patient Registeration and Login Pages/forgot_password.dart';
// import 'Patient Registeration and Login Pages/reset_password.dart';
// import '/Patient Registeration and Login Pages/email_verification.dart';
// import '/Patient Registeration and Login Pages/phone_number_confirmation.dart';
// import '/Patient Registeration and Login Pages/verification_choice.dart';
// import '/Patient Registeration and Login Pages/Patient_Registeration_Options.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserOptions(),
    );
  }
}

