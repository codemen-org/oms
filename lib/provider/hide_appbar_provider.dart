import 'package:flutter/material.dart';

class HideAppBarProvider extends ChangeNotifier {
  bool _bar = false;

  bool get bar => _bar;

  changeval(bool bar) async {
    _bar = bar;
    notifyListeners();
  }
}