
import 'noteModel.dart';

class Notes {
  static final List< Note> notes = [];

  static set setNote(Note note) {
    notes.add(note);
  }

  static updateNote(int index , Note note){
    notes[index]=note;

  }
  static delete(int index){
    notes.removeAt(index);
  }

}
