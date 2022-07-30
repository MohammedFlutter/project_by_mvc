import 'package:flutter/material.dart';
import 'package:project_by_mvc/model/noteMap.dart';
import 'package:project_by_mvc/model/noteModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, Note> notes = Notes.getNotes;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Note(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("Add");
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text('mvc'),
          ),
          body: Center(
            child: _lvContain(),
          )),
    );
  }

  Widget _lvContain() {
    if(notes.isEmpty)return Center(child: Text("you have 0 notes"),);
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(notes["$index"]!.title),
              Text(notes["$index"]!.discription)
            ],
          ),
        );
      },
      shrinkWrap: true,
      itemCount: notes.length,
    );
  }
}
