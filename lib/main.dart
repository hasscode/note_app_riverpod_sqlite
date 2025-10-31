import 'package:flutter/material.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
import 'package:note_app_sqlite_riverpod/notes/view/screens/note_details_screen.dart';
import 'package:note_app_sqlite_riverpod/notes/view/screens/notes_screen.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
home: NotesScreen(),

    );
  }
}
