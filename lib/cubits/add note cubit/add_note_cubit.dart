import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
	AddNoteCubit() : super(AddNoteInitial());
	
  addNote(NoteModel note) async{
    emit(AddNoteLoading());
   try {
     var notesBox = Hive.box<NoteModel>(notesBoxKey);
     await notesBox.add(note);
     emit(AddNoteSuccess());
   } catch (e) {
    emit(AddNoteFailure(e.toString()));
   } 
     
   
  }
	
}
