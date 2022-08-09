import 'package:flutter/material.dart';
import 'package:project_by_mvc/view/update.dart';
import 'package:provider/provider.dart';

import '../controller/notes_controller.dart';
import '../model/note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:floatButton(),
      appBar: AppBar(
        title: const Text('Notes with mvc'),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Consumer<NotesController>(builder: (context, controller, child) {
          return _lvContain(controller);
        }),
      ),
    );
  }
  Widget floatButton (){
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed("Add");
      },
      child: const Icon(Icons.add),
    );
  }
  Widget _lvContain(NotesController controller) {
    // List notes = controller.notes;

    return FutureBuilder(
        future: controller.notes,
        builder: (BuildContext context,AsyncSnapshot<List<Note>>  snapShot) {
          if(!(snapShot.hasData)) {
            return const CircularProgressIndicator();
          }

          if (snapShot.data!.isEmpty){
            return const Center(
              child: Text("you have 0 notes",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapShot.data![index].title),
                subtitle: Text(snapShot.data![index].discription),
                leading: IconButton(
                  icon: const Icon(Icons.update),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Updater(
                          note: snapShot.data![index],
                        )));
                  },
                ),
                trailing: IconButton(
                  icon:const Icon(Icons.delete),
                  onPressed: () {
                    controller.delete(snapShot.data![index]);
                  },
                ),
              );
            },
            // shrinkWrap: true,
            itemCount: snapShot.data!.length,
          );
        });
  }
}
