import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/image_picker.dart';
import '../utils/global_variables.dart';


class CustomImageProvider extends ChangeNotifier {
  AddImage a1 = AddImage(image: File(""));

  ImageCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String path = xFile!.path;

    a1.image = File(path);

    allImages = a1.image.path;

    notifyListeners();
  }

  ImageGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);

    String path = xFile!.path;

    a1.image = File(path);

    allImages = a1.image.path;

    notifyListeners();
  }

  ClearImage() {
    a1.image = File("");
    notifyListeners();
  }
}