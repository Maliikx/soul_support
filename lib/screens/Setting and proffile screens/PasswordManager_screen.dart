import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class passwordmanager extends StatefulWidget {
  const passwordmanager({super.key});

  @override
  State<passwordmanager> createState() => _passwordmanagerState();
}

class _passwordmanagerState extends State<passwordmanager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // Prevents shifting when keyboard appears
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
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
                padding: EdgeInsets.only(top: 200),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Password Manager",
                      style: TextStyle(
                        color: Color(0xff01709A),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: const Color(0xffFFFFFF).withOpacity(0.8),
                  ),
                  
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customwidget("Current Password"),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                              color: Color(0xff01709A),
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        customwidget("New Password"),
                        const SizedBox(height: 15),
                        customwidget("Confirm New Password"),
                        const SizedBox(height: 30),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff01709A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              minimumSize: const Size(150, 50),
                            ),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                ],
                ),
              ),
              Exitbtn(),
            ],
          ),
        ),
      );
    
  }

  Widget customwidget(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xff01709A),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff99C6D7).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xff99C6D7).withOpacity(0.5)),
            ),
            fillColor: const Color(0xff99C6D7).withOpacity(0.5),
            filled: true,
          ),
        ),
      ],
    );
  }
}
