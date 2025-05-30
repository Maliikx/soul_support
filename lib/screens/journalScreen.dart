import 'package:flutter/material.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/noteWritingScreen.dart';
import 'package:soul_support/transitions/custom_transitions.dart';
import 'package:soul_support/widgets/exitBtn.dart';
import 'package:soul_support/widgets/note.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {

   List<Widget> notes = [];
 
  void addNote() async {
  final result = await Navigator.push(
    context,
     partialSlideBtT( NoteWritingScreen()),
    
  );

  if (result != null && result is Map) {
    setState(() {

      notes.add(
        
        Note(
          title: result['title'],
          content: result['content'],
          date: result['date'],

        ),
      );
    });

  }
}

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -15,
            left: 30,
            child: Transform.rotate(
              angle: 0.4,
              child: Container(
                width: 720,
                height: 750,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color.fromARGB(195, 151, 202, 219), const Color.fromARGB(0, 151, 202, 219)],
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       stops: [0.1, 1],
                       ),
                        shape: BoxShape.circle
                            ),
                      ),
            )
            ),
             Positioned(
            top: 480,
            left: 300,
            child: Transform.rotate(
              angle: 0,
              child: Container(
                width: 340,
                height: 340,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color.fromARGB(255, 244, 223, 218), const Color.fromARGB(0, 244, 223, 218)],
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       stops: [0, 1],
                       ),
                        shape: BoxShape.circle
                            ),
                      ),
            )
            ),

            Container(
              height: screenHeight,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(bottom: 50),
                child: Container(
                  width: double.infinity,
                  
                  padding: EdgeInsets.only( top: 50, ),
                  child: Column(
                    children: [
                      Text("My Journal", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: primary
                      ),),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("we created a safe place so you can have a space to say whatever overwhelm you just remember that we are here for you",
                        style: TextStyle(
                          fontSize: 16,
                          color: primary
                        ),),
                      ),
                     SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        width: double.infinity,
                        color: const Color.fromARGB(157, 214, 232, 238),
                        child: Text("Latest Notes",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: primary
                        ),)
                        ),
                     SizedBox(height: 30,),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            runSpacing: 20,
                            children: notes,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            



            Exitbtn(),
        ],
      ),
       floatingActionButton: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: 10, bottom: 5),
         child: FloatingActionButton(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                shape: CircleBorder(),
                
                  onPressed: 
                  addNote,
                  child: Icon(Icons.add_circle_outline,size: 45,),
                ),
       ),
    );
  }
}