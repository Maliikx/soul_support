import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/documentationScreen.dart';
import 'package:soul_support/screens/homeScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class MentalDisorderScreen extends StatefulWidget {
  final String title;
  final String description;
  final String imgPath;

  const MentalDisorderScreen({
    required this.title,
    required this.description,
    required this.imgPath,
    super.key});

  @override
  State<MentalDisorderScreen> createState() => _MentalDisorderScreenState();
}

class _MentalDisorderScreenState extends State<MentalDisorderScreen> {
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
            ),
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
              child: SvgPicture.asset('assets/svg/bookIcon.svg',
              height: 330,
              color: const Color.fromARGB(191, 255, 255, 255),
              ),
            ),
            ),
             Padding(
              
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: SingleChildScrollView(
                 child: Column(
                  
                   children: [
                    SizedBox(height: 100,),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(30)
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(widget.title, style: TextStyle(
                             fontSize: 28,
                             fontWeight: FontWeight.bold,
                             color: primary,
                           ),),
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 20),
                             child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                               child: Container(
                                width: double.infinity,
                                height: 200,
                                child: Image.asset(widget.imgPath,
                                fit: BoxFit.cover,
                                )),
                             ),
                           ),
                           MarkdownBody(
                            data: widget.description,
                            styleSheet: MarkdownStyleSheet(
                              p: TextStyle(fontSize: 20, color: Colors.black), // Match your text style
                            ),
                          ),
                         ],
                       ),
                     ),
                    SizedBox(height: 50,),

                   ],
                 ),
               ),
             ),
           
          
            Exitbtn()
        ],
      ),
    );
  }
}