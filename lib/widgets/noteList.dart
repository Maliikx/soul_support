
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soul_support/cubits/note%20cubit/note_cubit.dart';
import 'package:soul_support/data/note_model.dart';
import 'package:soul_support/main.dart';
import 'package:soul_support/widgets/note.dart';

class notesList extends StatefulWidget {
  const notesList({
    super.key,
  });

  @override
  State<notesList> createState() => _notesListState();
}

class _notesListState extends State<notesList> {
  @override
  void initState() {
    BlocProvider.of<NoteCubit>(context).fetchAllNote();
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes!.reversed.toList();
        print(notes.length);
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 20,
            children: List.generate(notes.length, (i) => 
            Note(note: notes[i])
            
            )
            
            )
        
        
      );
      },
      
    );
  }
}