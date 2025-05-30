// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';



// import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:soul_support/screens/theraipist%20profile%20sections/CancelAppointment.dart';
import 'dart:convert';

import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/exitBtn.dart';

// import 'package:webview_flutter/webview_flutter.dart';
class Confirmappointment extends StatefulWidget {
  const Confirmappointment(
      {super.key,
      required this.Date,
      required this.Day,
      required this.Name,
      required this.Age,
      required this.Problem,
      required this.Time,
      required this.Gender,
      required this.doctor_name,
      required this.imgPath,
      
      });
  final String Date;
  final String Day;
  final String Name;
  final int Age;
  final String Problem;
  final String Time;
  final String Gender;
  final String doctor_name;
  final String imgPath;


  @override
  State<Confirmappointment> createState() => _ConfirmappointmentState();
}

class _ConfirmappointmentState extends State<Confirmappointment> {
  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Column(
                    children: [
                      Container(
                        height: screenHeight*0.16,
                        width: screenWidth-30,
                        child: Card(
                          
                          color: Color(0XFF99C6D7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,                          
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(widget.imgPath, fit: BoxFit.cover,)
                                      )
                                      ),
                                  
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white, // Background color
                                      borderRadius:
                                          BorderRadius.circular(13), // Rounded corners
                                      border:
                                          Border.all(color: Color(0xFFFFFFFF), width: 6),
                                    ),
                                    width: 242,
                                    height: 69,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.doctor_name,
                                        style: TextStyle(
                                            color: Color(0xFF01709A),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 2,
                          width: 310,
                          color: Color(0xFF01709A),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              height: 28,
                              width: 179,
                              decoration: BoxDecoration(
                                color: Color(0xFF01709A), // Background color
                                borderRadius:
                                    BorderRadius.circular(18), // Rounded corners
                                border: Border.all(color: Color(0xFFFFFFFF), width: 0),
                              ),
                              child: Center(
                                  child: Text(
                                " ${widget.Date}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0, top: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${widget.Day}," "${widget.Time}",
                            style: TextStyle(
                                color: Color(0xFF01709A),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 2,
                          width: 310,
                          color: Color(0xFF01709A),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 64.0),
                                child: Text("Full Name",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Age",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 37.0),
                                child: Text("Gender",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 130.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 37.0),
                                  child: Text(widget.Name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 37.0),
                                  child: Text("${widget.Age}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 37.0),
                                  child: Text(widget.Gender,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 2,
                          width: 310,
                          color: Color(0xFF01709A),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Problem",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Text(widget.Problem,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
            //                     Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PaymentView(
            //       onPaymentSuccess: () {
            //         // Handle payment success
            //       },
            //       onPaymentError: () {
            //         // Handle payment failure
            //       },
            //       price: 100, // Required: Total price (e.g., 100 for 100 EGP)
            //     ),
            //   ),
            // );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0889B9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            minimumSize: Size(208, 58),
                            elevation: 5, // Shadow depth
                            shadowColor: Colors.black.withOpacity(1),
                          ),
                          child: Text(
                            "Pay For The Appointment",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, slideRtL(Cancelappointment(doctor_name: widget.doctor_name, imgPath: widget.imgPath,)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0889B9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            minimumSize: Size(250, 58),
                            elevation: 5, // Shadow depth
                            shadowColor: Colors.black.withOpacity(1),
                          ),
                          child: Text(
                            "Cancel Appointment",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
          Exitbtn(),
        ],
      ),
    );
        
      
    
  }

//   Future<void> fetchPaymentKey() async {
//     final response = await http.post(
//       Uri.parse("http://10.0.2.2:5000/pay"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"amount": 100, "currency": "EGP"}),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print("Payment Key: ${data['paymentKey']}");
//       openPaymentPage(data['paymentKey']);
//     } else {
//       print("Error: ${response.body}");
//     }
//   }
//   void openPaymentPage(String paymentKey) async {
//     String iframeId = "908571";
//   String url =
//     "https://accept.paymob.com/api/acceptance/iframes/$iframeId?payment_token=$paymentKey";

//   if (Platform.isAndroid) {
//     await Process.run("am", ["start", "-a", "android.intent.action.VIEW", "-d", url]);
//   } else if (Platform.isIOS) {
//     await Process.run("open", [url]);
//   }
// }


  // Future<void> _pay() async {
  //   Paymobmanager().getPaymentKey(100, "EGP").then((String paymentKey) {
  //     launchUrl(Uri.parse(
  //         "https://accept.paymob.com/api/acceptance/iframes/908572?payment_token=$paymentKey"));
  //   });
  // }
}
