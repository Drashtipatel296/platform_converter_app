import 'package:flutter/material.dart';

class SwitchProvider extends ChangeNotifier{
  bool isAndroid = false;

  void onClick(bool value){
    isAndroid = value;
    notifyListeners();
  }
}