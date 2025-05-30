import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorSwitchStatment extends StatefulWidget {
  const DoctorSwitchStatment({super.key});

  @override
  State<DoctorSwitchStatment> createState() => _DoctorSwitchStatmentState();
}

class _DoctorSwitchStatmentState extends State<DoctorSwitchStatment> {
  @override

  Widget build(BuildContext context) {
   double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth*0.9,
      child: Card(
        
        color: Color(0XFFFFFFFF).withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 7,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Container(
                  child: Text("Schedule",
                      style: TextStyle(
                        color: Color(0xFF01709A),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              width: 134,
              height: 68,
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius:
                    BorderRadius.circular(32), // Rounded corners
                border:
                    Border.all(color: Color(0xFF97CADB), width: 6),
              ),
              child: Center(
                child: Text(
                  "About Doctor",
                  style: TextStyle(
                    color: Color(0xFF01709A),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                child: Text("     Review",
                    style: TextStyle(
                      color: Color(0xFF01709A),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            )
          ],
        )),
    );
  }
}