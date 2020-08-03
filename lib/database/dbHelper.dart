import 'package:floor/floor.dart';

@entity
class Note {
  @primaryKey
  final int id;
  final String heading;
  final String content;
  final String dateCreated;
  final String dateUpdated;

  Note(
      {this.content,
      this.dateCreated,
      this.dateUpdated,
      this.heading,
      this.id});
}
