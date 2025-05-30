import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class NoteWritingScreen extends StatefulWidget {
  const NoteWritingScreen({super.key});

  @override
  State<NoteWritingScreen> createState() => _NoteWritingScreenState();

}


class _NoteWritingScreenState extends State<NoteWritingScreen> {
  
   final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  
    void _saveNote() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = _titleController.text.trim();
    String content = _noteController.text.trim();
    

    if (content.isEmpty || title.isEmpty) {
      // TODO: Save note to  database
       ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Note & title can't be empty!"),
        backgroundColor: const Color.fromARGB(255, 188, 20, 20),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: screenHeight*0.1, ),
        duration: Duration(seconds: 2),
      ),
    );
      
    }
    else 
      Navigator.pop(context,
      {'title': title,
       'content': content,
       'date': DateTime.now(),

       }); 
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
// Positioned(
//             top: -15,
//             left: 30,
//             child: Transform.rotate(
//               angle: 0.4,
//               child: Container(
//                 width: 720,
//                 height: 750,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter,
//                        stops: [0.1, 1],
//                        ),
//                         shape: BoxShape.circle
//                             ),
//                       ),
//             )
//             ),
//              Positioned(
//             top: 480,
//             left: 300,
//             child: Transform.rotate(
//               angle: 0,
//               child: Container(
//                 width: 340,
//                 height: 340,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [const Color.fromARGB(255, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
//                        begin: Alignment.topCenter,
//                        end: Alignment.bottomCenter,
//                        stops: [0, 1],
//                        ),
//                         shape: BoxShape.circle
//                             ),
//                       ),
//             )
//             ),
            Container(
              // padding: EdgeInsets.only(top: 100),            
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: TextField(
                    controller: _titleController,
                    cursorColor: primary,
                    style: TextStyle(
                      fontSize: 28
                    ),
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      filled: true,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: "Untitled",
                      hintStyle: TextStyle(
                        fontSize: 28,
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: primary,
                      controller: _noteController,
                      maxLines: null,
                      expands: true,
                      style: TextStyle(
                        fontSize: 20
                      ),
                      decoration: InputDecoration(
                        
                        filled: true,
                        fillColor: const Color.fromARGB(180, 255, 255, 255),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        hintText: 'Your safe place to talk...',
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        ),)
                )
              ],
            ),
          ),
          // Exitbtn()
           Positioned(
            right: 25,
            bottom: screenHeight*0.1+25,
             child: GestureDetector(
              onTap: () {
                _saveNote();
              },
               child: Container(
                       height: 80,
                       width: 80,
                       decoration: BoxDecoration(
                         color: primary,
                         shape: BoxShape.circle,
                         boxShadow: [
                              BoxShadow(color: Colors.black.withAlpha(70), 
                             spreadRadius: 0,
                             blurRadius: 4,
                             offset: Offset(0 , 4)
                             )],
                       ),
               
                       child: Icon(
                        Icons.check_circle_outline,size: 45,
                        color: Colors.white,),
               
                       ),
             ),
           )
      
        ],
      ),
      );
  }
}