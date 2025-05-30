import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(height: 100,),
                  Text("Community",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(child: SvgPicture.asset("assets/svg/schedule.svg")),
                        Text("No Upcoming Event",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text("We will notify you with the upcoming events soon.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: primary
                          ),),
                        )
                      ],
                    ),
                  ),
              
                ],
              ),
            ),
        
        
            Exitbtn()
          ],
        ),
      ),
    );
  }
}