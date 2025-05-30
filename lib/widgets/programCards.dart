import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';

class ProgramCard extends StatefulWidget {
  final String title;
  final String linkTitle;
  final String imgPath;
  final VoidCallback? onTapLink;
  final VoidCallback? onTap;
  const ProgramCard({
    required this.title,
    required this.linkTitle,
    required this.imgPath,
    this.onTapLink,
    this.onTap,
    super.key});

  @override
  State<ProgramCard> createState() => _ProgramCardState();
}

class _ProgramCardState extends State<ProgramCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.866,
            decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(widget.imgPath,
          width: 40,),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
               width: (MediaQuery.of(context).size.width * 0.86)-80,
                child: Text(widget.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
               ),
               Text(widget.linkTitle, style: TextStyle(fontWeight: FontWeight.w300, color: primary),)
            ],
          ),
        ],
      ),
    );
  }
}