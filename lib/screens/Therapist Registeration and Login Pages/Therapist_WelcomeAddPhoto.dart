// import 'package:flutter/material.dart';
// import 'package:flutter_gradproj_1/Therapist_AccConfirmation.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// void main() {
//   runApp(const WelcomeAddPhoto());
// }

// class WelcomeAddPhoto extends StatelessWidget {
//   const WelcomeAddPhoto({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomeAddPhotoScreen(),
//     );
//   }
// }

// class WelcomeAddPhotoScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeAddPhotoScreen> {
//   File? _image;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Image
//           Container(
//             width: screenWidth,
//             height: screenHeight,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("Assets/image3.png"), // First background
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Logo
//           Positioned(
//             top: screenHeight * 0.041,
//             right: screenHeight * 0.13,
//             child: GestureDetector(
//               onTap: () {
//                 _pickImage();
//               },
//               child: Container(
//                 width: 148,
//                 height: 151,
//                 decoration: BoxDecoration(shape: BoxShape.circle),
//                 child: ClipOval(
//                   child:
//                       _image == null
//                           ? Image.asset(
//                             "Assets/Group 36713.png",
//                             width: 148,
//                             height: 151,
//                             fit: BoxFit.cover,
//                           )
//                           : Image.file(
//                             _image!,
//                             width: 148,
//                             height: 151,
//                             fit: BoxFit.cover,
//                           ),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 270,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 "Hi Doctor !",
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   fontFamily: "Montserrat",
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 300),

//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: screenWidth * 0.05),
//                       child: Text(
//                         "  Doctor id",
//                         style: TextStyle(
//                           color: Color(0xFFDAE7EB),
//                           fontFamily: "Montserrat",
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xFFDAE7EB),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: screenWidth * 0.05),
//                       child: Text(
//                         "  Password",
//                         style: TextStyle(
//                           color: Color(0xFFDAE7EB),
//                           fontFamily: "Montserrat",
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                     ),
//                     child: TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Color(0xFFDAE7EB),
//                         hintText: ".........",
//                         hintStyle: TextStyle(
//                           color: Color(0xFF000000),
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 15,
//                           horizontal: 20,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                         suffixIcon: Icon(
//                           Icons.visibility_off_outlined,
//                           color: Color(0xFF01709A),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.05,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Image(
//                               image: AssetImage("Assets/Checkbox/on.png"),
//                               width: 20,
//                               height: 20,
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                               " You must add photo",
//                               style: TextStyle(
//                                 color: Color(0xFFFF0004),
//                                 fontFamily: "Montserrat",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   SizedBox(
//                     width: 250,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         backgroundColor: Color(0xFF01709A),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(47),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => TherapistAccconfirmation(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         "Sign In",
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color(0xFFFFFFFF),
//                           fontFamily: "Montserrat",
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   Text(
//                     "Other sign in options",
//                     style: TextStyle(
//                       color: Color(0xFFFFFFFF),
//                       fontFamily: "Montserrat",
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image(
//                         image: AssetImage("Assets/Group 36691.png"),
//                         width: 39,
//                         height: 39,
//                       ),
//                       SizedBox(width: 20),
//                       Image(
//                         image: AssetImage("Assets/Group 36692.png"),
//                         width: 39,
//                         height: 39,
//                       ),
//                       SizedBox(width: 20),
//                       Image(
//                         image: AssetImage("Assets/Group 36693.png"),
//                         width: 39,
//                         height: 39,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
