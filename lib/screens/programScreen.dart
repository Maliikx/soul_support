import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/programCards.dart';

class ProgramScreen extends StatefulWidget {
  const ProgramScreen({super.key});

  @override
  State<ProgramScreen> createState() => _ProgramScreenState();
}

class _ProgramScreenState extends State<ProgramScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
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
          Positioned(
            left: 180,
            top: 50,
            child: Transform.rotate(
              angle: -0.5 ,
              child: SvgPicture.asset('assets/svg/programIcon.svg',
              height: 330,
              color: const Color.fromARGB(191, 255, 255, 255),
              ),
            ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("My Program", style: TextStyle(fontSize: 40,
                   fontWeight: FontWeight.bold,
                    color: primary),),
                ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(15, (index) => 
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2), // Adjust spacing
                          child: Container(
                            width: 1.5, // Dash width
                            height: 15, // Dash height
                            color: primary, // Dash color
                          ),
                        ),

                        ),

                      ),
                      SizedBox(width: 15,),
                      Column(
                        children: [
                          ProgramCard(title: "Who did you last take a walk with? Did you enjoy it?",
                          linkTitle: "Guided Journal",
                          imgPath: 'assets/imgs/paper.png',
                          ),
                          SizedBox(height: 15,),
                          ProgramCard(title: "Find  a unique inspiring qoute",
                          linkTitle: "Inspiring Quotes",
                          imgPath: 'assets/imgs/quote.png',
                          ),
                          SizedBox(height: 15,),
                          ProgramCard(title: "Log how you feel right now ",
                          linkTitle: "Mood Tracker",
                          imgPath: 'assets/imgs/emoticons.png',
                          ),
                          SizedBox(height: 15,),
                          ProgramCard(title: "Clear Your mind and your soul",
                          linkTitle: "Music",
                          imgPath: 'assets/imgs/music.png',
                          ),
                        ],
                      ),
                    ],
                  )
            
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            child: 
            Dock( currentIndex: 1,)),
          
        ],
      ),
    );
  }
}