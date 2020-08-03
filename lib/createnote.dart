import 'package:flutter/material.dart';
import 'package:notee/database/appDatabaseHelper.dart';
import 'package:notee/database/note_dao.dart';

import 'constants.dart';
import 'database/dbHelper.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  NoteDao noteDao;

  final AppDatabaseHelper appDatabaseHelper = AppDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: kWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: kTextColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  FlatButton(
                      onPressed: () async {
                        Note noteparsing = Note(
                            content: bodyController.text.trim(),
                            dateCreated: DateTime.now().toString(),
                            dateUpdated: DateTime.now().toString(),
                            heading: titleController.text);
                        await appDatabaseHelper.database.noteDao
                            .insertNote(noteparsing);
                        Navigator.pushNamed(context, '/',
                            arguments: noteparsing);
                      },
                      child: Text(
                        'Save Note',
                        style: TextStyle(fontSize: 18, color: kPrimaryColor),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 46,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter a Note Title',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: Container(
                          color: kWhite,
                          child: TextFormField(
                            maxLines: null,
                            controller: bodyController,
                            decoration: InputDecoration(
                              hintText: 'Enter Note',
                              border: InputBorder.none,
                              fillColor: kWhite,
                              filled: true,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
