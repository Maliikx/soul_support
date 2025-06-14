import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Exitbtn extends StatefulWidget {
  const Exitbtn({super.key});

  @override
  State<Exitbtn> createState() => _ExitbtnState();
}

class _ExitbtnState extends State<Exitbtn> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
               right: 20,
               top: 35,
               child: GestureDetector(
                 onTap: () {
                  // Navigator.pop(context);
                }
                ,child: Container(
                padding: EdgeInsets.all(7.5),
                // color: Colors.redAccent,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)
                ),
                //  child: SvgPicture.asset('assets/svg/xIcon.svg',
                //   width: 40,
                //   color: Color(0xFF01709A),
                //   ),
                child: Image(
                      image: AssetImage("assets/fi-rr-cross.png")),
               )));
  }
}