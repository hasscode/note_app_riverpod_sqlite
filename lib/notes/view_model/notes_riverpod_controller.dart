import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/notes_repository.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/repository_provider.dart';

class NotesController extends StateNotifier<AsyncValue <List<NoteModel>>>{
  final NotesRepository notesRepository;

  NotesController( this.notesRepository) :super (AsyncValue.loading(
  )){
    loadNotes();
  }

  Future<void>loadNotes() async{

    final results = await notesRepository.readData();

    results.fold((failure){
state =AsyncValue.error(failure, StackTrace.current);
    }, (notes){
      state =AsyncValue.data(notes);

    });
  }

  Future<void>addNotes(NoteModel note) async {
    await notesRepository.insertNote(note);
  loadNotes();
  }

  Future<void>deleteNote(int id)async{
    await notesRepository.deleteNote('DELETE FROM notes WHERE id = $id');
    loadNotes();
  }
  Future<void>updateNote(NoteModel note)async{
    await notesRepository.updateNote(note);
    loadNotes();
  }

}

final notesControllerProvider = StateNotifierProvider<NotesController,AsyncValue<List<NoteModel>>>((ref){
  final repo = ref.watch(notesRepoProvider);
  return NotesController(repo);

});