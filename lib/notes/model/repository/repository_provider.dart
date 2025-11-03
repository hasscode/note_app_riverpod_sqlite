import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app_sqlite_riverpod/notes/model/data_source/local_data_source.dart';
import 'package:note_app_sqlite_riverpod/notes/model/repository/notes_repository_impl.dart';

final notesRepoProvider = Provider<NotesRepositoryImpl>((ref){
  final localDataSource = LocalDataSourceImpl();
  return NotesRepositoryImpl(localDataSource);
});