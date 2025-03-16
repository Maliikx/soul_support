// import 'package:flutter/material.dart';
// // import 'package:flutter_gradproj_1/Therapist_Home.dart';

// void main() {
//   runApp(const AccConfirmation());
// }

// class AccConfirmation extends StatelessWidget {
//   const AccConfirmation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AccConfirmation(),
//     );
//   }
// }

// class TherapistAccconfirmation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // First background
//           Container(
//             width: screenWidth,
//             height: screenHeight,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   "Assets/account-creation.png",
//                 ), // First background
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const SizedBox(height: 70),
//                 const Text(
//                   "           Your account\n was successfully created!",
//                   style: TextStyle(
//                     fontSize: 29,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFFFFFFF),
//                     fontFamily: "Montserrat",
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Text(
//                   "Only one click to be better",
//                   style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 13),
//                 ),
//                 const SizedBox(height: 170),
//                 SizedBox(
//                   width: 250,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 15),
//                       backgroundColor: Color(0xFF01709A),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(47),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TherapistHome(),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Sign In",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Color(0xFFFFFFFF),
//                         fontFamily: "Montserrat",
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
