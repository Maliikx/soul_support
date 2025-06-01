import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/moodLoggerFaces.dart';

class MoodLoggerScreen extends StatefulWidget {
  const MoodLoggerScreen({super.key});

  @override
  State<MoodLoggerScreen> createState() => _MoodLoggerScreenState();
}

class _MoodLoggerScreenState extends State<MoodLoggerScreen> {
  TextEditingController controller = TextEditingController();
  double yOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Scaffold(
        backgroundColor: primary,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            // Background Decorations
            Positioned(
              top: 120,
              right: -150,
              child: Transform.rotate(
                angle: 0.4,
                child: Container(
                  width: 340,
                  height: 340,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(205, 244, 223, 218),
                        const Color.fromARGB(0, 244, 223, 218)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0, 1],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 40,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  width: 650,
                  height: 580,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(123, 64, 149, 183),
                        const Color.fromARGB(0, 151, 202, 219)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 1],
                    ),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                ),
              ),
            ),

            // Main Content
            SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 50,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "How are we feeling today?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "tap the face icon to log your mood",
                    style: TextStyle(
                      color: const Color.fromARGB(200, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 40),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (yOffset <= -800) {
                              yOffset = 0;
                            } else {
                              yOffset -= 200;
                            }
                          });
                        },
                        child: MoodLoggerFaces(yOffset: yOffset),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),

                  Text(
                    "Describe your feeling",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextField(
                      controller: controller,
                      maxLines: 2,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(12),
                        hintText: "I'm feeling happy...",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Save Button
                  GestureDetector(
                    onTap: () async {
                      if (controller.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please describe your feeling")),
                        );
                        return;
                      }

                      var box = await Hive.openBox('myBox');
                      List moodsDetailed = box.get('moodsDetailed', defaultValue: []);

                      moodsDetailed.add({
                        'description': controller.text.trim(),
                        'timestamp': DateTime.now().toIso8601String(),
                      });

                      await box.put('moodsDetailed', moodsDetailed);

                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
