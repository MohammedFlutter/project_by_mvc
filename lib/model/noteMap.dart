import 'package:flutter/material.dart';

import 'noteModel.dart';

class Notes {
  static final Map<int, Note> notes = Map<int, Note>();
  static int noNote = 0;

  static set setNote(Note note) {
    notes[noNote++] = note;
  }

  static updateNote(int key , Note note){
    notes.update(key, (value) => note)  ;

  }
  static delete(int key){
    notes.remove(key);
  }

}
