import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_by_mvc/model/note.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static  Database? _db;
  final String table = "Notes";

  final String id = "_id";
  final String title = "title";
  final String descr = "description";
  Future<Database?> get db async{
    if(_db!=null){
      return _db;
    }
    _db = await initDB();
    return _db;
  }


  initDB() async {
    Directory directoryApp = await getApplicationDocumentsDirectory();
    String path = join(directoryApp.path, "Notes.db");
    return openDatabase(path, version: 1, onCreate: _oncreate);
  }

  _oncreate(Database db, int version) async {
    String sql = "CREATE TABLE $table("
        "$id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$title TEXT ,"
        "$descr TEXT);";
    await db.execute(sql);
  }

  Future<List<Note>> readNotes() async {
    Database? dbClient = await db;
    List<Map> response = await dbClient!.query(table);
    List<Note> notes = List.generate(
        response.length,
        (index) => Note(response[index][title], response[index][descr],
            id: response[index][id]));
    return notes;
  }

  insertNote(Note note) async {
    Database? dbCliet = await db;
    await dbCliet!.insert(table, note.toMap());
  }

  deleteNote(Note note) async {
    Database? dbClient = await db;
    return await dbClient!.delete(table, where: "$id=?", whereArgs: [note.id]);
  }

  updateNote(Note note) async {
    Database? dbClient = await db;
    return await dbClient!.update(table, note.toMap(),
        where: "$id=?", whereArgs: [note.id]);
  }
}
