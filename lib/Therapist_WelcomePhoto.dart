import 'package:flutter/material.dart';
import 'Therapist_AccConfirmation.dart';

void main() {
  runApp(const WelcomePhoto());
}

class WelcomePhoto extends StatelessWidget {
  const WelcomePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePhotoScreen(),
    );
  }
}

class WelcomePhotoScreen extends StatefulWidget {
  const WelcomePhotoScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomePhotoScreen> {
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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/Group 6878.png"), // First background
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Second background
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: Image.asset(
                "Assets/Rectangle 223.png", // Second background image
                width: screenWidth * 1,
                height: screenHeight * 0.95,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..scale(-1.0, 1.0),
              child: Image.asset(
                "Assets/Rectangle 223.png", // Second background image
                width: screenWidth * 1,
                height: screenHeight * 0.95,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo
          Positioned(
            top: screenHeight * 0.041,
            right: screenHeight * 0.13,
            child: Image.asset(
              "Assets/Group 36713(1).png",
              width: 147,
              height: 152,
              fit: BoxFit.contain,
            ),
          ),

          const Positioned(
            top: 230,
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
                      child: const Text(
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
                        fillColor: const Color(0xFFDAE7EB),
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
                      child: const Text(
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
                        fillColor: const Color(0xFFDAE7EB),
                        hintText: ".........",
                        hintStyle: const TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(
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
                        const Row(
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
                          child: const Text(
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

                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: const Color(0xFF01709A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TherapistAccconfirmation(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFFFF),
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    "Other sign in options",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Montserrat",
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Row(
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
