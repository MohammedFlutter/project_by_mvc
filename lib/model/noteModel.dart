import 'package:flutter/material.dart';

class Note  {
  late String _title;
  late String _discription;

  Note(this._title, this._discription);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get discription => _discription;

  set discription(String value) {
    _discription = value;
  }
}
