// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/main.dart';
// // import 'package:flutter_application_1/screens/exerciseScreen.dart';
// import 'package:soul_support/screens/homeScreen.dart';
// import 'package:soul_support/screens/moodLoggerScreen.dart';
// import 'package:soul_support/screens/programScreen.dart';
// import 'package:soul_support/screens/therapistScreen.dart';
// import 'package:soul_support/transitions/custom_transitions.dart';
// import 'package:soul_support/widgets/dockBtn.dart';
// import 'package:soul_support/widgets/screenWrapper.dart';

// class Dock extends StatefulWidget {
//   final int currentIndex;
//   // final VoidCallback onPlusPressed; // mood log

//   const Dock({
//     required this.currentIndex,
//     // required this.onPlusPressed,
//     super.key});

//     void _onBtnTapped(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         Navigator.pushReplacement(
//         context,
//         fadeTransition(ScreenWrapper(child:  HomeScreen())),
//       );
//       case 1:
//         Navigator.pushReplacement(
//         context,
//         fadeTransition(ScreenWrapper(child:  ProgramScreen())),
//       );
//       case 2:
//         Navigator.pushReplacement(context, 
//         fadeTransition(ScreenWrapper(child:  TherapistScreen())),

//         );
//         case 3:
//         Navigator.pushReplacement(context, 
//         fadeTransition(ScreenWrapper(child:  ExerciseScreen())),

//         );
//         case 5:
//           Navigator.push(
//             context,
//             halfSlideBtT(
//               MoodLoggerScreen(),
//             ),
//           );
//         break;
//     }
//   }

//   @override
//   State<Dock> createState() => _DockState();
// }

// class _DockState extends State<Dock> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       width: MediaQuery.of(context).size.width*0.95,
//       height: 85,
      
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       width: MediaQuery.of(context).size.width*0.95,
//       height: 60,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(180, 156, 184, 193),
//         // border: Border.all(color: Colors.white, width: 1),
//         borderRadius: BorderRadius.circular(30),
//       ),),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               DockBtn(size: 60,
//                icon: 'assets/svg/homeIcon.svg',
//                 color: accent,
//                  onTap: () => widget.currentIndex== 0 ? {} : widget._onBtnTapped(context, 0),
//                   isActive: widget.currentIndex== 0 ? true : false ,),

//               DockBtn(size: 60,
//                icon: 'assets/svg/programIcon.svg',
//                 color: accent,
//                  onTap: () => widget.currentIndex== 1 ? {} : widget._onBtnTapped(context, 1),
//                   isActive: widget.currentIndex== 1 ? true : false,),
//               DockBtn(size: 85,
//                icon: 'assets/svg/plusIcon2.svg',
//                 color: primary,
//                 onTap: () => widget._onBtnTapped(context, 5),
//                  isActive: false,),
//               DockBtn(size: 60,
//                icon: 'assets/svg/therapistIcon.svg',
//                 color: accent, 
//                  onTap: () => widget.currentIndex== 2 ? {} : widget._onBtnTapped(context, 2),
//                  isActive: widget.currentIndex== 2 ? true : false,),
//               DockBtn(size: 60,
//                icon: 'assets/svg/exerciseIcon.svg',
//                color: accent, 
//                  onTap: () => widget.currentIndex== 3 ? {} : widget._onBtnTapped(context, 3),
//                  isActive: widget.currentIndex== 3 ? true : false,),
              
             
//             ],
//           ),
          
//         ],
//       ),
//     );
//   }
// }