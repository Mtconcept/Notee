import 'package:floor/floor.dart';
import 'dbHelper.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> findAllNotes();

  @Query('SELECT * FROM Note WHERE id = :id')
  Stream<Note> findNoteByID(int id);

  @insert
  Future<void> insertNote(Note note);

  @update
  Future<int> updateNote(Note note);

}
