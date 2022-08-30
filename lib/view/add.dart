import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/notes_controller.dart';
import '../model/note.dart';

class Adder extends StatefulWidget {
  const Adder({Key? key}) : super(key: key);

  @override
  State<Adder> createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController titleContr = TextEditingController();
  TextEditingController descrContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: Center(
        child: Container(

          margin: const EdgeInsets.all(20),
          child: Form(
            key: formState,
            child: Column(
              //
              children: [
                textFFTitle(titleContr), textFFDescr(descrContr),
                Spacer(),
                // btnSubmit(context),
                Consumer<NotesController>(
                  builder: (context, controller, child) {
                    return ElevatedButton(
                        onPressed: () {
                          if (formState.currentState!.validate()) {
                            controller.insert(Note(titleContr.text, descrContr.text));
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text("Submit"));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

  Widget textFFTitle(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      decoration: const InputDecoration(
        hintText: "Title",
      ),
      validator: (value) => (value!.isEmpty) ? "Title is empty" : null,
    );
  }

  Widget textFFDescr(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      maxLines: 1,
      decoration: const InputDecoration(
        hintText: "Description",
      ),
      validator: (value) => (value!.isEmpty) ? "Title is empty" : null,
    );
  }


}
