import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoodLoggerFaces extends StatefulWidget {
  double yOffset;
   MoodLoggerFaces({
    required this.yOffset,
    super.key});

  @override
  State<MoodLoggerFaces> createState() => _MoodLoggerFacesState();
}

class _MoodLoggerFacesState extends State<MoodLoggerFaces> {
  @override
  Widget build(BuildContext context) {
    return Stack(
alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          top: widget.yOffset,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 255, 234, 115), const Color.fromARGB(0, 244, 223, 218)],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             stops: [0, 1],
                             ),
                ),
                child: SvgPicture.asset('assets/svg/face0.svg', height: 180,)),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 185, 248, 146), const Color.fromARGB(0, 244, 223, 218)],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             stops: [0, 1],
                             ),
                ),
                child: SvgPicture.asset('assets/svg/face1.svg', height: 180,)),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 146, 223, 248), const Color.fromARGB(0, 244, 223, 218)],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             stops: [0, 1],
                             ),
                ),
                child: SvgPicture.asset('assets/svg/face2.svg', height: 180,)),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 248, 189, 176), const Color.fromARGB(0, 244, 223, 218)],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             stops: [0, 1],
                             ),
                ),
                child: SvgPicture.asset('assets/svg/face3.svg', height: 180,)),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [const Color.fromARGB(255, 223, 165, 243), const Color.fromARGB(0, 244, 223, 218)],
                             begin: Alignment.topCenter,
                             end: Alignment.bottomCenter,
                             stops: [0, 1],
                             ),
                ),
                child: SvgPicture.asset('assets/svg/face4.svg', height: 180,)),
            ],
          ),
        ),
      ],
    );
  }
}