import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
	NoteCubit() : super(NoteInitial());

  List<NoteModel>? notes;
	
  fetchAllNote(){

     var notesBox = Hive.box<NoteModel>(notesBoxKey);

     notes = notesBox.values.toList();     
     emit(NoteSuccess());
     
  }
	
}
