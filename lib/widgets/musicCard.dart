import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/musicScreen.dart';

class MusicCard extends StatefulWidget {
  final String title;
  final String description;
  final String duration;
  final String imgPath;
  
  const MusicCard({
    required this.title,
    required this.description,
    required this.duration,
    required this.imgPath,
    super.key});

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  double xOffset = 0;
   double yOffset = 0;
  double scaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
        
      alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width*0.7,
        
        decoration: BoxDecoration(
           boxShadow: [BoxShadow(color: background, 
                             spreadRadius: 0,
                             blurRadius: 10,
                             offset: Offset(0 , 0)
                             )],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              child: ClipPath(//curved container
                clipper: SCurveClipper(),
                child: Container(
                  // alignment: Alignment.topCenter,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30),
                       ),
                       child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                        
                         child: Image.asset(widget.imgPath,
                         fit: BoxFit.cover,
                         ),
                       ),
                    
                  ),
                ),
            ),
            Positioned(
              bottom: 25,
              left: 15,
              child: Row(
                children: [
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        child: Text(widget.title,
                        style: TextStyle(
                          fontSize: 25,
                          color: primary,
                          fontWeight: FontWeight.w500
                        ),
                        ),
                      ),
                      Text(widget.description,
                        style: TextStyle(
                          color: primary
                        )

                      ),
                      Text(widget.duration,
                        style: TextStyle(
                          color: primary
                        )

                      ),
                    ],
                  ),
                 
                ],)),
                 Positioned(
                   bottom: 60,
                   right: 20,
                   child: GestureDetector(
                     onTap: () {
                      setState(() {
                        scaleFactor = 1.5;
                      });
                    },
                     child: Icon(Icons.play_circle_fill_rounded,
                      size: 70,
                      color: primary,
                      ),
                   ),
                 )
      
            
          ],
      
        ),
      ),
    );
  }
}