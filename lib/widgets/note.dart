import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soul_support/main.dart';



class Note extends StatefulWidget {
  final String title;
  final String content;
  final DateTime date;


  const Note({
    required  this.title,
    required  this.content,
     required this.date,
    super.key});
  

  @override
  State<Note> createState() => _NoteState();
  
}


class _NoteState extends State<Note> {

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.width;
String formattedDate = DateFormat('MMMM d, y').format(widget.date); // "May 29, 2025"


    return GestureDetector(
      onTap: () {
      },
      child: Container(
        
        width: screenWidth/2.3,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(181, 255, 255, 255),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( 
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
              
              child: Text(widget.title, 
              overflow: TextOverflow.ellipsis,
              
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: Text(widget.content,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 18
                ),
              )),
            SizedBox(height: 10,),
      
      
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(formattedDate,
              style: TextStyle(
                color: primary,
              ),))
      
          ],
        ),
      ),
    );
  }
}