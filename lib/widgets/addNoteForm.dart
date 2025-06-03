import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:soul_support/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:soul_support/cubits/note%20cubit/note_cubit.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/screens/noteWritingScreen.dart';

class AddNoteForm extends StatefulWidget {
  final NoteModel? note;

  const AddNoteForm({super.key, this.note});
  
  
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  
    final GlobalKey<FormState> _formKey =  GlobalKey();
    String? title, content;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    
    @override
      void dispose() {
      titleController.dispose();
      contentController.dispose();
      super.dispose();
      }
      void _onEditPressed(){
        widget.note!.title = title ?? widget.note!.title;
        widget.note!.content = content ?? widget.note!.content;
        widget.note!.save();
        BlocProvider.of<NoteCubit>(context).fetchAllNote();
        Navigator.pop(context);
      }
      void _onSavePressed() {
      double screenHeight = MediaQuery.of(context).size.height;
      String formattedDate = DateFormat('MMMM d, y').format(DateTime.now()); // "May 29, 2025"


      final trimmedTitle = titleController.text.trim();
      final trimmedContent = contentController.text.trim();

      if (!(trimmedTitle.isEmpty || trimmedContent.isEmpty)) {
         _formKey.currentState!.save();
         var noteModel = NoteModel(
           title: title!, 
           content: content!, 
           date: formattedDate);
         BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);

      }
  // One (or both) field(s) are empty → show feedback (e.g. SnackBar)
        else{
            ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Note & title can't be empty!"),
        backgroundColor: const Color.fromARGB(255, 188, 20, 20),
        behavior: SnackBarBehavior.floating,

        duration: Duration(seconds: 2),
      ),
    );
        return;
      }
      }
      
  @override
  Widget build(BuildContext context)  {
        String? oldTitle = widget.note?.title;
        String? oldContent = widget.note?.content;

        titleController.text = oldTitle ?? '';
        contentController.text = oldContent ?? '';

        double screenHeight = MediaQuery.of(context).size.height;
  

    return Scaffold(
      body: Form(
        key: _formKey,
        
      
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: CustomTextField( 
                    controller: titleController,
                    onSaved: (titleController){
                      title = titleController;
                    },
                    onChange:(titleController){
                      title = titleController;
                    },
                    
                  ),
                ),
                Expanded(
                  child: CustomContentFeild(
                    controller: contentController,
                    onSaved: (contentController){
                      content = contentController;
                    },
                    onChange: (contentController){
                      content = contentController;
                    },
                  )
                )
              ],
            ),
            // Positioned(
            //   right: 25,
            //   bottom: screenHeight*0.1+25,
            //    child: GestureDetector(
            //     onTap: widget.note == null ? _onSavePressed : _onEditPressed,
            //      child: Container(
            //              height: 80,
            //              width: 80,
            //              decoration: BoxDecoration(
            //                color: primary,
            //                shape: BoxShape.circle,
            //                boxShadow: [
            //                     BoxShadow(color: Colors.black.withAlpha(70), 
            //                    spreadRadius: 0,
            //                    blurRadius: 4,
            //                    offset: Offset(0 , 4)
            //                    )],
            //              ),
                 
            //              child: Icon(
            //               Icons.check_circle_outline,size: 45,
            //               color: Colors.white,),
                 
            //              ),
            //    ),
            //  )
          ],
        ),
      ),
       floatingActionButton: Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: 10, bottom: 5),
         child: FloatingActionButton(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                shape: CircleBorder(),
                  onPressed: widget.note == null ? _onSavePressed : _onEditPressed,
                  // addNote,
                
                  child: Icon(Icons.check_circle_outline,size: 45,),
                ),
       ),
    );
  }
}
