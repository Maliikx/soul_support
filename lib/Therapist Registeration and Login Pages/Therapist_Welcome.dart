import 'package:flutter/material.dart';
import 'Therapist_WelcomeAddPhoto.dart';

void main() {
  runApp(const Welcome());
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
  // Therapist_WelcomeAddPhotoScreenState createState() => Therapist_WelcomeAddPhotoSreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/image.png"), // First background
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Second background
          Positioned(
            top: 270,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Hi Doctor !",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 300),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "  Doctor id",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Text(
                        "  Password",
                        style: TextStyle(
                          color: Color(0xFFDAE7EB),
                          fontFamily: "Montserrat",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFDAE7EB),
                        hintText: ".........",
                        hintStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFF01709A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage("Assets/Checkbox/on.png"),
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Color(0xFFDAE7EB),
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),

                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget password?",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // SizedBox(
                  //   width: 250,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(vertical: 15),
                  //       backgroundColor: Color(0xFF01709A),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(47),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => WelcomeAddPhotoScreen(),
                  //         ),
                  //       );
                  //     },
                  //     child: const Text(
                  //       "Sign In",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         color: Color(0xFFFFFFFF),
                  //         fontFamily: "Montserrat",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 30),

                  Text(
                    "Other sign in options",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("Assets/Group 36691.png"),
                        width: 39,
                        height: 39,
                      ),
                      SizedBox(width: 20),
                      Image(
                        image: AssetImage("Assets/Group 36692.png"),
                        width: 39,
                        height: 39,
                      ),
                      SizedBox(width: 20),
                      Image(
                        image: AssetImage("Assets/Group 36693.png"),
                        width: 39,
                        height: 39,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
