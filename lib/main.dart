import 'package:flutter/material.dart';
import 'package:project_by_mvc/view/add.dart';
import 'package:provider/provider.dart';

import 'controller/notes_controller.dart';
import 'view/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => NotesController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "Home": (context) => const HomePage(),
        "Add": (context) => const Adder(),
        // "Update": (context)=> Updater(),
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(titleLarge: TextStyle(fontSize: 30)),
        inputDecorationTheme:
            InputDecorationTheme(border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.amber,
            ),
      ),
      home: const HomePage(),
    );
  }
}
