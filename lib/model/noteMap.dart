import 'noteModel.dart';

class Notes{
  static final Map<String,Note> _notes=Map<String,Note>();
  static int noNote=0;
  static get getNotes=>_notes;
  _Notes(){
  }
  static set note(Note note){
    _notes["${noNote++}"]=note;

  }
  static get getNote=>_notes["${noNote++}"];
}