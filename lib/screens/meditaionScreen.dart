import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class MeditaionScreen extends StatefulWidget {
  final String title;
  final String description;
  const MeditaionScreen({
    required this.title,
    required this.description,
    super.key});

  @override
  State<MeditaionScreen> createState() => _MeditaionScreenState();
}

class _MeditaionScreenState extends State<MeditaionScreen> {
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

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Guided by a short introductory course, start meditating.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    ),
                  ),
                  Container(
                    width: 370,
                    height: 370,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                gradient: LinearGradient(colors: [accent, const Color.fromARGB(0, 151, 202, 219)],
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       stops: [0, 0.7],
                       ),
                        shape: BoxShape.circle
                            ),
                    child: SvgPicture.asset("assets/svg/meditating.svg")),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      decoration: BoxDecoration(
                        color: accent,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(
                        children: [
                          Text("4 min 35 sec",
                          style: TextStyle(
                            color: primary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text("The aim of this first  exercise is to show you the basic principles and techniques to make your meditiations as satisfying as possible.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                            height: 55,
                            width: 220,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text("Start",
                            style: TextStyle(color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                            )),
                          ),
                  
              ],),
            ),

            Exitbtn()
        ],
      ),
    );
  }
}