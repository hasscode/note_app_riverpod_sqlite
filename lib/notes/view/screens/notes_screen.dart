import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_sqlite_riverpod/notes/model/data_source/local_data_source.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/notes_repository.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/notes_repository_impl.dart';
import 'package:note_app_sqlite_riverpod/notes/view/screens/new_note_screen.dart';
import 'package:note_app_sqlite_riverpod/notes/view/widgets/bottom_app_bar.dart';
import 'package:note_app_sqlite_riverpod/notes/view/widgets/note_item_widget.dart';
import 'package:note_app_sqlite_riverpod/notes/view_model/notes_riverpod_controller.dart';

class NotesScreen extends ConsumerWidget {
  NotesScreen({super.key});
  List<NoteModel> dummyNotes = [
    NoteModel(
      id: 1,
      title: 'Note One',
      description:
          'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),

    NoteModel(
      id: 1,
      title: 'Note One',
      description:
      'description descriptiondescriptiondescriptiondescriptiondescription description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description description ',
      dateTime: '10 may,2025',
      color: Colors.cyan,
    ),
  ];
  NotesRepository notesRepository = NotesRepositoryImpl(LocalDataSourceImpl());
  @override
  Widget build(BuildContext context,widgetRef) {
    final notesState = widgetRef.watch(notesControllerProvider);
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewNoteScreen()));
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        child: const Icon(
          Icons.add_rounded,
          color: Color(0xff297EBF),
          size: 45,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: const CustomBottomAppBar(),
      backgroundColor: Color(0xff297EBF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Hello Hassan !',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.light_mode_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Notes',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: notesState.when(
                    data: (notes)=>
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: notes.length,
                          itemBuilder: (context, i) =>
                              NoteItemWidget(noteModel: notes[i]),
                        )
                    , error: (error,context)=>Text(error.toString(),style: TextStyle(color: Colors.red),)

                    , loading: ()=>CircularProgressIndicator(color: Colors.blue,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
