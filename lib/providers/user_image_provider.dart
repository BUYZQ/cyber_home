import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImageProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  File? image;

  Future<void> getImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      image = File(photo.path);
      notifyListeners();
    } else {
      image = null;
      notifyListeners();
    }
  }
}