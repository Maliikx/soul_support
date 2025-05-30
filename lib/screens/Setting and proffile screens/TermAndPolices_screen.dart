import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class termandpolices extends StatefulWidget {
  const termandpolices({super.key});

  @override
  State<termandpolices> createState() => _termandpolicesState();
}

class _termandpolicesState extends State<termandpolices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              Positioned(
              top: -15,
              left: 30,
              child: Transform.rotate(
                angle: 0.4,
                child: Container(
                  width: 720,
                  height: 750,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         stops: [0.1, 1],
                         ),
                          shape: BoxShape.circle
                              ),
                        ),
              )
              ),
               Positioned(
              top: 480,
              left: 300,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: 340,
                  height: 340,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
                         begin: Alignment.topCenter,
                         end: Alignment.bottomCenter,
                         stops: [0, 1],
                         ),
                          shape: BoxShape.circle
                              ),
                        ),
              )
              ),
              
              Container(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Terms and Policies",
                    style: TextStyle(
                        color:Color(0xff01709A),
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                      
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Container(
                                  decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(35),
                                   color: const Color(0xffD9E7EC).withOpacity(0.8)),
                                   
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("last update: 14/08/2024",
                                                        style: TextStyle(
                                  color:Color(0xff01709A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(" Welcome to Soul Support (the App). By accessing or using the App, you agree to be bound by these Terms and Conditions (Terms)."
                                                          " If you do not agree with these Terms, you must not use the App."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text("terms & conditions",
                                                        style: TextStyle(
                                  color:Color(0xff01709A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text("1. Eligibility"
                                                       " You must be at least 13 years old to use the App."
                                                          "By using the App, you confirm that you are of legal age and have the capacity to agree to these Terms."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text("2.Use of the App"
                                                        "The App is intended for informational and supportive purposes only. It is not a substitute for professional medical advice, diagnosis, or treatment."
                                                        "You agree to use the App only for lawful purposes and in accordance with these Terms."
                                                      , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text("3.User Responsibilities"
                                                        "You are responsible for maintaining the confidentiality of your account and password."
                                                      "You agree not to share your account credentials with others."
                                                      "You agree not to use the App to harm others or engage in any illegal activities."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "4.Intellectual Property"
                                                         "All content, features, and functionality of the App (including but not limited to text, graphics, logos, and software) are owned by Soul Support and are protected by copyright and other intellectual property laws."
                                                      "You may not reproduce, distribute, or create derivative works from the App's content without prior written consent."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "5.Disclaimer of Warranties"
                                                       "The App is provided as is and as available without any warranties, express or implied."
                                                        "Soul Support does not guarantee the accuracy, completeness, or usefulness of the App's content."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "6.Limitation of Liability"
                                                         "Soul Support shall not be liable for any indirect, incidental, or consequential damages arising from your use of the App."
                                                      "In no event shall our total liability exceed the amount you paid to use the App, if any."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text("Policies",
                                                        style: TextStyle(
                                  color:Color(0xff01709A),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "1.Information We Collect"
                                                          "Personal Information: Name, email address, age, gender, and other information you provide during registration."
                                                      "Health Information: Mental health data, mood logs, and other information you input into the App."
                                                      "Usage Data: Information about how you use the App, such as session duration and features accessed."
                                                      "Device Information: IP address, device type, operating system, and browser type."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "2.How We Use Your Information"
                                                        "To provide and improve the App's services."
                                                          "To personalize your experience."
                                                          "To communicate with you, including sending updates and support messages."
                                                          "To comply with legal obligations."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "3.Data Security"
                                                        "We implement industry-standard security measures to protect your data, including encryption and access controls."
                                                        "However, no method of transmission over the internet is 100% secure, and we cannot guarantee absolute security."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "4.Children's Privacy"
                                                        "The App is not intended for children under 13 years old."
                                                        "We do not knowingly collect personal information from children."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                      SizedBox(height: 15),
                                                      Text(  "5.Contact Us If you have any questions about these Terms or the Privacy Policy, please contact us at [Your Email Address]."
                                                        , style: TextStyle(
                                  color:Color(0xff000000),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                    ],
                                      ),
                                    ),
                                  ),
                                  ),
                        ),
                      ),
                    ),
                            
                  ],
                ),
              ),
        Exitbtn(),
    ])
    );
  }
}
