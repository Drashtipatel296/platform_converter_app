import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier{
  bool isOpen = false;

  void onTap(bool value){
    isOpen = value;
    notifyListeners();
  }
}