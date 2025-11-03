import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_sqlite_riverpod/notes/view/screens/notes_screen.dart';

void main() {
  
  runApp(const ProviderScope(child: NoteApp()));
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
