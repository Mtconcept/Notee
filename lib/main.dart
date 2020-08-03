import 'package:flutter/material.dart';
import 'package:notee/database/appDatabaseHelper.dart';
import 'package:notee/routing/route.dart';
import 'database/database.dart';
import 'myNotes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
  AppDatabaseHelper appDatabaseHelper = AppDatabaseHelper();
  
  appDatabaseHelper.database = database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRoute.generateRoute,
      home: MyNotes(),
    );
  }
}
