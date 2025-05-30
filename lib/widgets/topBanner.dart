import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({super.key});

  @override
  State<TopBanner> createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)), // Rounds the corners
                     
                       child: Stack(
                        children: [
                          Container(//banner
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))
                            ),
                          ),
                          Positioned(//big circle
                            left: -135,
                            top: -135,
                            child: Container(
                              height: 350,
                              width: 350,
                       
                              decoration: BoxDecoration(
                                color: bigCircle,
                                borderRadius: BorderRadiusDirectional.circular(350)
                       
                       
                                ),),
                          ),
                          Positioned(//small circle
                            left: -50,
                            top: -48,
                            child: Container(
                              height: 200,
                              width: 200,
                       
                              decoration: BoxDecoration(
                                color: smallCircle,
                                borderRadius: BorderRadiusDirectional.circular(200)
                       
                       
                                ),),
                          ),
                          
                                            
                       
                        ],
                       ),
                     );
  }
}