import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class TestBanner extends StatefulWidget {
  const TestBanner({super.key});

  @override
  State<TestBanner> createState() => _TestBannerState();
}

class _TestBannerState extends State<TestBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: Text("Take a quick test", 
                  style: TextStyle(fontSize: 16,
                                   fontWeight: FontWeight.bold,
                                   color: primary
                                   ),
                  ),
                 ),
                 SizedBox(
                  height: 10,
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: banners,
                      boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), 
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0 , 4)
                      )],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              width: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                                child: Image.asset('assets/imgs/test.jpeg',
                                fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Transform.translate(
                        offset: Offset(120, 0),
                        child: Container(
                              height: 150,
                              width: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [banners, const Color.fromARGB(0, 255, 255, 255)],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                                stops: [0.4, 0.9],
                                ),
                        
                              ),
                        ),
                      ),

                          ],
                        ),
                        Expanded(
                          child: Container(
                            

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  alignment: Alignment.topLeft,
                                  child: Text("Wellbeing Test", style: TextStyle(fontSize: 15,
                                   color: primary,
                                    fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left,
                                    ),
                                ),
                                Container(
                                  width: 200,
                                  alignment: Alignment.center,
                                  child: Text("Check your anxiety, stress and depression levels by wellbeing tests.",
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                  )),
                            
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                   ),
                 ),
    ],);
  }
}