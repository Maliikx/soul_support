import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class DocumentaionCard extends StatefulWidget {
  final String title;
  final String imgPath;
  const DocumentaionCard({
    required this.title,
    required this.imgPath,
    super.key});

  @override
  State<DocumentaionCard> createState() => _DocumentaionCardState();
}

class _DocumentaionCardState extends State<DocumentaionCard> {
  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.bold,
              color: primary
            ),),
    
            Text("Learn more",
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
            
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: screenWidth*0.9,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(widget.imgPath,
                fit: BoxFit.cover,
                )),
            )
          ],
        ),
      ),
    );
  }
}