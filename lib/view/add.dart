import 'package:flutter/material.dart';

import '../model/noteMap.dart';
import '../model/noteModel.dart';

class Adder extends StatefulWidget {
  const Adder({Key? key}) : super(key: key);

  @override
  State<Adder> createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: formState,
              child: Column(
                children: [textFFTitle(), textFFDiscr(),
                  btnSubmit()
                ],
              ),
            ),
          ),
        ));
    ;
  }

  Widget textFFTitle() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Title",
      ),
      validator: (value) => (value!.isEmpty) ? "Title is empty" : null,
    );
  }

  Widget textFFDiscr() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Discreption",
      ),
      validator: (value) => (value!.isEmpty) ? "Title is empty" : null,
    );
  }

  Widget btnSubmit() {
    return ElevatedButton(onPressed: () {
      var note =Note();
      note.title='title';
      note.discription="DIN Alternate";
      Notes.note=Note();

      Navigator.of(context).pop();
    }, child: Text("Submit"));
  }
}
