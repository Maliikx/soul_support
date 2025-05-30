import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/communityScreen.dart';
import 'package:soul_support/screens/documentationScreen.dart';
import 'package:soul_support/screens/therapistScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/availableTherapistsCard.dart';
import 'package:soul_support/widgets/dock.dart';
import 'package:soul_support/widgets/exerciseCard.dart';
import 'package:soul_support/widgets/headerCard.dart';
import 'package:soul_support/widgets/screenWrapper.dart';
import 'package:soul_support/widgets/testBanner.dart';
import 'package:soul_support/widgets/topBanner.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          
         Container( //banner
          height: MediaQuery.of(context).size.height,
    
           child: Stack(
            alignment: Alignment.topCenter,
            
    
             children: [
              Positioned(
            top: -50,
            left: 200,
            child: Transform.rotate(
              angle: 0.12,
              child: Container(
                width: 720,
                height: 750,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
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
            top: 480,
            left: -175,
            child: Transform.rotate(
              angle: 0.12,
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
               Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                      children: [
                      
                      SizedBox(
                  height: 155,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
    
                      children: [
                       HeaderCard(height: 140, width: 165, text: 'Therapist', 
                       onTap: () => {
                        Navigator.pushReplacement(context, 
                                fadeTransition(ScreenWrapper(child: const TherapistScreen())),

                                )
                       }, 
                       imgPath: 'assets/imgs/doc1.jpeg'),
                        SizedBox(
                          width: 20,
                        ),
                        HeaderCard(height: 140, width: 165, text: 'Documentations',
                         onTap: () => {
                           Navigator.push(context, 
                     slideBtT(ScreenWrapper(child: const DocumentationScreen()))
                     )
                         }, 
                         imgPath: 'assets/imgs/documetaion.png'),
                        SizedBox(
                          width: 20,
                        ),
                        HeaderCard(height: 140, width: 165, text: 'Community',
                         onTap: () => {
                          Navigator.push(context, 
                     slideBtT(ScreenWrapper(child: const CommunityScreen())))
                         }, 
                         imgPath: 'assets/imgs/community.jpeg'),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                          height: 20,
                   ),
                 
                 TestBanner(),
                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Container(
                    width: double.infinity,
                     child: Text("Available Therapists", 
                      style: TextStyle(fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: primary
                                       ),),
                   ),
                 ),
                 SizedBox(
                  height: 10,
                 ),
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: Row(
                      
                       children: [
                         AvailabletherapistsCard(
                          name: 'Dr. Ethar Ayman', 
                          time: 'Today, 08:00 : 12:00 ', 
                          height: 110,
                          width: 280,
                          color: Color.fromARGB(153, 255, 255, 255),
                          imgPath: "assets/imgs/doc2.jpeg",),
                         SizedBox(
                          width: 20,
                         ),
                         AvailabletherapistsCard(
                          name: 'Dr. Mark Williams', 
                          time: 'Today, 08:00 : 12:00 ', 
                          height: 110,
                          width: 280,
                          color: Color.fromARGB(153, 255, 255, 255),
                          imgPath: "assets/imgs/doc1.jpeg",),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height: 30,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Container(
                    width: double.infinity,
                     child: Text("For you", 
                      style: TextStyle(fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: primary
                                       ),),
                   ),
                 ),
                 SizedBox(
                  height: 10,
                 ),
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 15),
                     child: Row(
                      
                       children: [
                         Exercisecard(title: 'Can\'t sleep?', numberOfEcercises: '9 exercises', imgPath: 'assets/imgs/exercise1.jpeg',),
                         SizedBox(
                          width: 20,
                        ), 
                         Exercisecard(title: 'Anxious?', numberOfEcercises: '7 exercises', imgPath: 'assets/imgs/exercise2.jpg',),
                         SizedBox(
                          width: 20,
                         ), 
                         Exercisecard(title: 'Stress?', numberOfEcercises: '4 exercises', imgPath: 'assets/imgs/exercise3.jpeg',),
    
                         
                        
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                  height: 120,
                 )
                 
                 
                ],
                
                
              ),
          ),
                     TopBanner(),
                     Positioned(
                       top: 120,
                       child: Container(
                         height: 60,
                         width: 240,
                                            
                         decoration: BoxDecoration(
                           boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), 
                           spreadRadius: 0,
                           blurRadius: 4,
                           offset: Offset(0 , 4)
                           )],
                           color: Colors.white,
                           borderRadius: BorderRadiusDirectional.circular(200)             
                           ),
                           
                           child:Center(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(
                                   
                                   child: Text("Talk with SoulMate", 
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold, 
                                     fontSize: 16),),
                                 ),
                                 SizedBox(width: 5,),
                                 Image.asset('assets/logos/logo.png',
                                 width: 50,)
                               ],
                             ),
                           ),
                           ),
                     ),
                     
                     Positioned(
            bottom: 30,
            child: 
            Dock( currentIndex: 0,)),
               
                   ],
                 ),
               ),
        ],
      ),
      
      
    );
  }
}