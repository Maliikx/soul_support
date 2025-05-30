import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/homeScreen.dart';
import 'package:soul_support/screens/mentalDisorderScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/documentaionCard.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/screenWrapper.dart';
import 'package:soul_support/data/mental_disorders_data.dart';

class DocumentationScreen extends StatefulWidget {
  const DocumentationScreen({super.key});

  @override
  State<DocumentationScreen> createState() => _DocumentationScreenState();
}

class _DocumentationScreenState extends State<DocumentationScreen> {
  // final List<Map<String, String>> documentationData = [
  // {
  //   "title": "Anxiety Disorders",
  //   "imgPath": "assets/imgs/docImg1.jpg"
  // },
  // {
  //   "title": "Crazy Disorders",
  //   "imgPath": "assets/imgs/docImg2.jpg"
  // },
  // {
  //   "title": "Bipolar Disorders",
  //   "imgPath": "assets/imgs/docImg2.jpg"
  // },

// ];
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
           
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("What is a mental disorder ?", 
                    style: TextStyle(fontSize: 40,
                           fontWeight: FontWeight.bold,
                            color: primary)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        color: const Color.fromARGB(200, 151, 202, 219),
                        child: Text("Mental disorders are health conditions that affect a person’s thinking, emotions, and behavior. They can cause significant distress and make it difficult to function in daily life. These disorders can range from anxiety and depression to more severe conditions like schizophrenia. With proper care and support, people living with mental disorders can lead fulfilling lives.", 
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                                    SizedBox(height: 20,),
          
                       Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(mentalDisorders.length, (i) => 
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20), // Adjust spacing
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, 
                                            slideRtL(ScreenWrapper(child: MentalDisorderScreen(title: mentalDisorders[i]["title"]!, description: mentalDisorders[i]["description"]!, ))));
                                          },                                  
                                  child: DocumentaionCard(
                                    title: mentalDisorders[i]["title"]!,
                                    imgPath: "assets/imgs/anxiety.jpg",
                                  ),
                                )
                              ),
            
                              ),
            
                            ),
                ],
              ),
            ),
          ),


            Exitbtn(),
        ],
      ),
      
    );
  }
}