import 'package:flutter/material.dart';
import 'package:notee/database/appDatabaseHelper.dart';
import 'package:notee/database/note_dao.dart';
import 'constants.dart';
import 'database/dbHelper.dart';

class MyNotes extends StatefulWidget {
  final Note notes;
  MyNotes({Key key, this.notes}) : super(key: key);
  @override
  _MyNotesState createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> {
  NoteDao noteDao;
  Note note;
  List<Note> notes;

  final AppDatabaseHelper appDatabaseHelper = AppDatabaseHelper();

  Future<List<Note>> fetchNote() async {
    return await appDatabaseHelper.database.noteDao.findAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.pushNamed(context, '/createNote');
          }),
      appBar: AppBar(
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'My Notes',
          style: TextStyle(fontSize: 24, color: kPrimaryColor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: kTextColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(icon: Icon(Icons.search), onPressed: null)),
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: fetchNote(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 36.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Expanded(
                                flex: 1,
                                  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].heading.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(snapshot.data[index].content,
                                        style: TextStyle(color: kTextColor)),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Icon(Icons.more_vert),
                                    ],
                                  ),
                                ),
                                Text(snapshot.data[index].dateCreated)
                              ],
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor),
                  ),
                  Text(
                    'Getting Data',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
