import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/meditaionScreen.dart';
import 'package:soul_support/screens/musicScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/screenWrapper.dart';

class ExerciseBanner extends StatefulWidget {
  final String title;
  final String description;
  final String imgPath;
  const ExerciseBanner({
    required this.title,
    required this.description,
    required this.imgPath,
    super.key});

  @override
  State<ExerciseBanner> createState() => _ExerciseBannerState();
}

class _ExerciseBannerState extends State<ExerciseBanner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                          context,
                          slideRtL(ScreenWrapper(child:  MeditaionScreen(title: widget.title, description: widget.description,))),
                        );
      },
      child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(198, 129, 173, 186),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: Image.asset(widget.imgPath,
                                width: 200,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 175,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(widget.title,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                    ),
                                    Text(widget.description,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("Watch now",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            ),
                                            Icon(Icons.play_circle_filled_rounded,
                                             color: Colors.white,
                                             size: 35,
                                             )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
    );
  }
}