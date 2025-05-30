import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class HeaderCard extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback? onTap;
  final String imgPath;
  const HeaderCard({
    required this.height, 
    required this.width, 
    required this.text,
    this.onTap, 
    required this.imgPath,
    super.key});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                      color: banners,
              boxShadow: [BoxShadow(color: Colors.black.withAlpha(70), 
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0 , 4)
                      )],
              border: Border.all(color: banners ,width: 4),
              borderRadius: BorderRadius.circular(30)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30), // Match border radius
                child: Image.asset(
                  widget.imgPath, 
                  fit: BoxFit.cover,
                  alignment: Alignment(0, -0.1),
               ),
              ),
          ),
          Transform.translate(
            offset: Offset(0, 76),
            child: Container(
                            height: 60,
                            width: widget.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [banners, const Color.fromARGB(0, 255, 255, 255)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.4, 0.9],
                              ),
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)) // Match border radius

                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(widget.text, style: TextStyle(color: primary, fontSize: 18),)),
                                    ),)
        ],
      ),
    );
  }
}