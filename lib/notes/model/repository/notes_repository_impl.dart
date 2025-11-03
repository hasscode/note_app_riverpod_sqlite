import 'package:dartz/dartz.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/notes_repository.dart';

import '../data_source/local_data_source.dart';
import '../models/note_model.dart';

class NotesRepositoryImpl implements NotesRepository{
  final  LocalDataSource localDataSource;
  NotesRepositoryImpl(this.localDataSource);
  @override
  Future<Either<String, int>> deleteNote(String sql) async{
   return await localDataSource.deleteNote(sql);
  }

  @override
  Future<Either<String, int>> insertNote(NoteModel note) async{
    final sql = '''
    INSERT INTO notes (title, note, date, color)
    VALUES ("${note.title}", "${note.description}", "${note.dateTime}", ${note.color.value})
  ''';

    return await localDataSource.insertData(sql);
  }

  @override
  Future<Either<String,List<NoteModel>>> readData() async{
final  data =    await localDataSource.readData('''
SELECT * FROM notes
''');
return data.fold((fail){
  return left(fail);
}, (notes){
List<NoteModel>  allNotes =(notes as List).map((note)=>NoteModel.fromSQL(note)).toList();
  return  right(allNotes);
});

  }

  @override
  Future<Either<String, int>> updateNote(NoteModel note) async {
    final sql = '''
    UPDATE notes
    SET 
      title = "${note.title}",
      note = "${note.description}",
      date = "${note.dateTime}",
      color = ${note.color.value}
    WHERE id = ${note.id}
  ''';

    return await localDataSource.updateData(sql);
  }

}