import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soul_support/cubits/note%20cubit/note_cubit.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/noteWritingScreen.dart';



class Note extends StatefulWidget {
  final NoteModel note;


  const Note({
    super.key, required this.note});
  

  @override
  State<Note> createState() => _NoteState();
  
}


class _NoteState extends State<Note> {

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.width;
// String formattedDate = DateFormat('MMMM d, y').format(widget.date); // "May 29, 2025"


    return GestureDetector(
      onLongPressStart:(details) { showMenu(
        color: Colors.white,
        shadowColor: primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              context: context,
              position: RelativeRect.fromLTRB(
                details.globalPosition.dx,
                details.globalPosition.dy,
                details.globalPosition.dx,
                details.globalPosition.dy,
              ),

              items: [
                PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ).then((value) {
              if (value == 'edit') {
                 showModalBottomSheet(
           backgroundColor: Colors.transparent,
                        isScrollControlled: true,
              
                    context: context, 
           builder: (context){
                      return FractionallySizedBox(
                        heightFactor: 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          child: NoteWritingScreen(note: widget.note)));
                        });
              }
             else {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 111, 169, 189),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      title: Text('Delete Note?',
                            style: TextStyle(color: Colors.white)),
                      content: Text('Are you sure you want to delete this note?',
                            style: TextStyle(color: Colors.white)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context), // Cancel
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            widget.note.delete();
                            BlocProvider.of<NoteCubit>(context).fetchAllNote();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            });},
      onTap: () {
 
        showModalBottomSheet(
           backgroundColor: Colors.transparent,
                        isScrollControlled: true,
              
                    context: context, 
           builder: (context){
                      return FractionallySizedBox(
                        heightFactor: 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                          child: NoteWritingScreen(note: widget.note)));
                        });
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
              
              child: Text(widget.note.title, 
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
              child: Text(widget.note.content,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 18
                ),
              )),
            SizedBox(height: 10,),
      
      
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(widget.note.date,
              style: TextStyle(
                color: primary,
              ),))
      
          ],
        ),
      ),
    );
  }
}