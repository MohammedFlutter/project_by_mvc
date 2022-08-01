import 'package:flutter/material.dart';
import 'package:project_by_mvc/view/update.dart';
import 'package:provider/provider.dart';

import '../controller/notes_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map<String, Note> notes = Notes.getNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("Add");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('mvc'),
      ),
      body: Consumer<NotesController>(builder: (context, controller, child) {
        return _lvContain(controller);
      }),
    );
  }

  Widget _lvContain(NotesController controller) {
    List notes = controller.notes;

    if (notes.isEmpty)
      return Center(
        child: Text("you have 0 notes"),
      );
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(notes[index]!.title),
          subtitle: Text(notes[index]!.discription),
          leading: IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Updater(note: notes[index],index: index,)));
              print(index);
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              controller.delete(index);
            },
          ),
        );
      },
      // shrinkWrap: true,
      itemCount: notes.length,
    );
  }
}
