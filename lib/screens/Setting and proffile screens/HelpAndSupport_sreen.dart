import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class helpandsupport_screen extends StatefulWidget {
  const helpandsupport_screen({super.key});

  @override
  State<helpandsupport_screen> createState() => _helpandsupport_screenState();
}

class _helpandsupport_screenState extends State<helpandsupport_screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffD6E8EE),
        body: Stack(
            children: [
             Positioned(
              top: -480,
              left: 30,
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
                width: double.infinity,
                padding: EdgeInsets.only(top: 80),
                 child: Column(
                   children: [
                     Container(
                      height: 200,
                      margin: EdgeInsets.only(right: 100),
                       child: Image(image: AssetImage("assets/logos/bigLogo.png",
                       ),
                       ),
                     ),
                     Text("Soul Support",
                     style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Redressed'
                     ),
                     ),
                      Expanded(
                        child: Padding(
                             padding: EdgeInsets.only(bottom: 15, right: 15, left: 15,),
                          child: ClipRRect(
                           borderRadius: BorderRadius.circular(30),
                          
                            child: SingleChildScrollView(
                             scrollDirection: Axis.vertical,
                             physics: AlwaysScrollableScrollPhysics(),
                              child: Container(
                                decoration: BoxDecoration(
                                                       color: const Color(0xffFFFFFF)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(15.0),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Account & Security",
                                                            style: TextStyle(color: Color(0xff01709A),
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold),),
                                                            SizedBox(height: 15),
                                                            Text("Q: How do I reset my password?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("To reset your password, go to Settings > Security > "
                                                                "Change Password. If you've forgotten your password, select Forgot Password on the login screen, and we’ll email you a link to reset it.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 15),
                                                            Text("Q: Can I enable two-factor authentication (2FA) for my account?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("To reset your password, go to Settings > Security > Change Password. If you've forgotten your password,"
                                                                " select Forgot Password on the login screen, and we’ll email you a link to reset it.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 15),
                                                            Text("Q: How do I delete my account?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: We're sorry to see you go! To delete your account, "
                                                                "visit Settings > Account > Delete Account. Please note that this action is permanent and will erase all your data.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 10),
                                                            Text("Privacy & Data",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold),),
                                                            SizedBox(height: 15),
                                                            Text("Q: What data does the app collect, and how is it used?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: We only collect data essential for app functionality, such as login information and usage data."
                                                                " All data is stored securely, and we never share it with third parties without your consent. For details, see our Privacy Policy.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 15),
                                                            Text("Q: Can I download or delete my data?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: Yes, you can request a copy of your data or ask to have it deleted."
                                                                " Go to Settings > Privacy > Manage Data for options.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 15),
                                                            Text("Troubleshooting",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 20,
                                                                  fontWeight: FontWeight.bold),),
                                                            SizedBox(height: 15),
                                                            Text("Q: I’m not receiving notifications. What should I do?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: First, check if notifications are enabled in the app under Settings > Notifications."
                                                                " Also, ensure notifications are allowed for the app in your device’s settings.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 10),
                                                            Text("Q: The app is freezing or crashing. How can I fix this?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: If you're experiencing issues, try restarting the app, clearing the cache, or reinstalling it. "
                                                                "You can also check if updates are available, as new versions often include bug fixes.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                                            SizedBox(height: 10),
                                                            Text("Q: How do I report a bug or suggest a feature?",
                                                              style: TextStyle(color: Color(0xff01709A),
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight.w600),),
                                                            SizedBox(height: 10),
                                                            Text("A: We value your feedback! Go to Help & Support >"
                                                                " Feedback to send us your suggestions or report an issue.",
                                                              style: TextStyle(color: Color(0xff000000),
                                                                  fontSize: 13,
                                                                  fontWeight: FontWeight.w300),),
                                
                                
                                
                                                          ],),
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
               ]  ),
               
    );
  }
}
