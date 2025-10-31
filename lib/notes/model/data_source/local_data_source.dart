import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<Either<String, Database>> initDB();
  Future<Either<String,List<Map<String ,dynamic>>>> readData(String sql);
  Future<Either<String, int>> insertData(String sql);
  Future<Either<String, int>> updateData(String sql);
  Future<Either<String, int>> deleteData(String sql) ;
  Future<Either<String, Unit>> deleteMyDB();
}

class LocalDataSourceImpl implements LocalDataSource {
  static Database? _db;
  Future<Either<String, Database>> getDatabase() async {
    if (_db != null) {
      return Right(_db!);
    } else {
      final result = await initDB();
      result.fold(
            (error) => Left(error),
            (db) => _db = db,
      );
      return result;
    }
  }
  @override
  Future<Either<String, Database>> initDB() async {
    try {
      final String pathdb = await getDatabasesPath();
      String path = join(pathdb, 'noteApp.db');

      Database myDB = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE notes (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT NOT NULL,
              note TEXT NOT NULL,
             date TEXT NOT NULL,
             color INTEGER NOT NULL
            )
          ''');
        },
      );

      return Right(myDB);
    } catch (e) {
      return Left('Error initializing database: $e');
    }
  }

  @override
  Future<Either<String, Unit>> deleteMyDB() async {
    try {
      final String pathdb = await getDatabasesPath();
      String path = join(pathdb, 'noteApp.db');

      await deleteDatabase(path);


      return Right(unit);
    } catch (e) {
      return Left('Error initializing database: $e');
    }
  }


  @override
  Future<Either<String, List<Map<String, dynamic>>>> readData(String sql) async {
    final dbResult = await getDatabase();

    if (dbResult.isLeft()) return Left(dbResult.fold((l) => l, (r) => ''));

    final db = dbResult.getOrElse(() => throw Exception("DB not found"));
    try {
      final response = await db.rawQuery(sql);
      return Right(response);
    } catch (e) {
      return Left('Error executing query: $e');
    }
  }

  @override
  Future<Either<String, int>> insertData(String sql) async {
    final dbResult = await getDatabase();
    if (dbResult.isLeft()) return Left(dbResult.fold((l) => l, (r) => ''));

    final db = dbResult.getOrElse(() => throw Exception("DB not found"));
    try {
      final response = await db.rawInsert(sql);
      return Right(response);
    } catch (e) {
      return Left('Error inserting data: $e');
    }
  }

  @override
  Future<Either<String, int>> updateData(String sql) async {
    final dbResult = await getDatabase();
    if (dbResult.isLeft()) return Left(dbResult.fold((l) => l, (r) => ''));

    final db = dbResult.getOrElse(() => throw Exception("DB not found"));
    try {
      final response = await db.rawUpdate(sql);
      return Right(response);
    } catch (e) {
      return Left('Error updating data: $e');
    }
  }

  @override
  Future<Either<String, int>> deleteData(String sql) async {
    final dbResult = await getDatabase();
    if (dbResult.isLeft()) return Left(dbResult.fold((l) => l, (r) => ''));

    final db = dbResult.getOrElse(() => throw Exception("DB not found"));
    try {
      final response = await db.rawDelete(sql);
      return Right(response);
    } catch (e) {
      return Left('Error deleting data: $e');
    }
  }
}