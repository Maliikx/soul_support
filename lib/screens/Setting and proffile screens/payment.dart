import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:soul_support/screens/Setting%20and%20proffile%20screens/paymop.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
          Text("Payment",
          style: TextStyle(
              color:Color(0xff01709A),
              fontSize: 24,
              fontWeight: FontWeight.w500
          ),
        ),
         SizedBox(height: 300),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: ElevatedButton(
                onPressed: () async=>_pay(),
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
      ]),
    )]));
  }
  Future<void> _pay() async {
    PaymobManager().paywithPaymob(100).then((String paymentKey) {
      launchUrl(Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/908572?payment_token=$paymentKey"));
    });
  }
}
