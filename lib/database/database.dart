import 'package:floor/floor.dart';
import 'package:notee/database/note_dao.dart';
import 'dbHelper.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'database.g.dart';


@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase { 
  NoteDao get noteDao;
}
