import 'package:flutter/material.dart';
import 'package:notee/createnote.dart';
import 'package:notee/myNotes.dart';

class CustomRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MyNotes(
                  notes: args,
                ));
      case '/createNote':
        return MaterialPageRoute(builder: (_) => CreateNote());

      default:
        errorRoute();
    }
    return errorRoute();
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Text(
          " This Page don't Exist pls go back ",
          style: TextStyle(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      );
    });
  }
}
