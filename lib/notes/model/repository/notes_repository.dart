import 'package:dartz/dartz.dart';
import 'package:note_app_sqlite_riverpod/notes/model/models/note_model.dart';


abstract class NotesRepository{
  Future<Either<String,List<NoteModel>>> readData();
  Future<Either<String, int>> insertNote(NoteModel note);
  Future<Either<String, int>> updateNote(NoteModel note);
  Future<Either<String, int>> deleteNote(String sql) ;
}