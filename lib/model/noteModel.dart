import 'package:flutter/material.dart';

class Note extends ChangeNotifier {
  late String _title;
  late String _discription;

  String get title => _title;

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  String get discription => _discription;

  set discription(String value) {
    _discription = value;
    notifyListeners();
  }
}
