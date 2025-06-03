import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:soul_support/cubits/add%20note%20cubit/add_note_cubit.dart';
import 'package:soul_support/cubits/note%20cubit/note_cubit.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/addNoteForm.dart';
import 'package:soul_support/widgets/exitBtn.dart';

class NoteWritingScreen extends StatefulWidget {
  final NoteModel? note;
  const NoteWritingScreen({super.key, this.note});


  @override
  State<NoteWritingScreen> createState() => _NoteWritingScreenState();

}


class _NoteWritingScreenState extends State<NoteWritingScreen> {
  
   

  @override
  Widget build(BuildContext context) {
    // Iterable notes = Hive.box<NoteModel>(notesBoxKey).values;
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Scaffold(
        body: Container(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state){
            if (state is AddNoteFailure) {
              print("error message yasta ${state.errorMessage}");
            }
            if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fetchAllNote();
            Navigator.pop(context);
              
            }
          },
          builder: (context, state){
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              color: primary,
            ),
            inAsyncCall: state is AddNoteLoading? true : false,
            child: AbsorbPointer(
              absorbing: state is AddNoteLoading? true : false,
              child: AddNoteForm(note: widget.note)));
      
          },
          
          ),
      
          ),
        ),
    );
  }
}


class CustomContentFeild extends StatelessWidget {
      final TextEditingController controller;

  const CustomContentFeild({
    super.key, this.onSaved, required this.controller, this.onChange,
  });
  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {


    return TextFormField(
      onChanged: onChange,
      controller: controller,
      onSaved: onSaved,
      validator: (value)=>null,
      cursorColor: primary,
        maxLines: null,
        expands: true,
        style: TextStyle(
          fontSize: 20
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          filled: true,
          fillColor: const Color.fromARGB(180, 255, 255, 255),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: 'Your safe space to talk...',
          hintStyle: TextStyle(
            fontSize: 20,
          ),
          border: InputBorder.none,
          ),);
  }
}

class CustomTextField extends StatelessWidget {
    final TextEditingController controller;

  
   const CustomTextField({
    super.key, this.onSaved, required this.controller, this.onChange,
  });
    final void Function(String?)? onSaved;
    final void Function(String?)? onChange;



  @override
  Widget build(BuildContext context) {


    return TextFormField(
      onChanged: onChange,
      controller: controller,
      onSaved: onSaved,
      validator: (value)=> null,
      cursorColor: primary,
      style: TextStyle(
        fontSize: 28
      ),
      decoration: InputDecoration(
       focusedErrorBorder: InputBorder.none,
       contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: "Untitled",
        hintStyle: TextStyle(
          fontSize: 28,
        )
      ),
    );
  }
}