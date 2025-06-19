import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/therapistProfileScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class AvailabletherapistsCard extends StatefulWidget {
  final String name;
  final String time;
  final Color color;
  final double height;
  final double width;
  final String imgPath;
  final VoidCallback? onTap;
  const AvailabletherapistsCard({
    required this.name,
    required this.time,
    required this.color,
    required this.height,
    required this.width,
    required this.imgPath,
    this.onTap,
    super.key,
    });

  @override
  State<AvailabletherapistsCard> createState() => _AvailabletherapistsCardState();
}

class _AvailabletherapistsCardState extends State<AvailabletherapistsCard> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:() {
        Navigator.push(context,
            slideRtL(ScreenWrapper(child: TherapistProfile()))
        );
      },
      child: Container(
        height: widget.height,//110
        width: widget.width,//280
        decoration: BoxDecoration(
            color: widget.color, //Color.fromARGB(153, 255, 255, 255)
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 110,
                  width: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                    child: Image.asset(widget.imgPath,
                      fit: BoxFit.cover,
                      alignment: Alignment(0.7, 0),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(85, 0),
                  child: Container(
                    height: 110,
                    width: 35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [widget.color, const Color.fromARGB(0, 255, 255, 255)],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: [0.4, 0.9],
                      ),

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                  style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ), ),
                Text("Therapist",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  ),),
                SizedBox(height: 5,),
                Text(widget.time),
              ],)
          ],
        ),
      ),
    );
  }
}