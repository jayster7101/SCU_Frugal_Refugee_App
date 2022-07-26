import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

/// Class to handle data loading of profile
/// Should handle pictures, user data, etc.
class ProfileData {
  ProfileData() {
    /* _loadData(); */
  }
  String nameFirst = "Test";
  String nameLast = "Test";
  File image = File("");
  late Image profilePicture;

  /// Function to get image location
  File getImage() {
    return image;
  }

  /// Function to obtain first name
  /// as a string
  String getFirstName() {
    return nameFirst;
  }

  /// Function to obtain last name
  /// as a string
  String getLastName() {
    return nameLast;
  }

  /// Function to change `nameFirst`
  void changeFirstName(string) {
    nameFirst = string;
  }

  /// Function to change `nameLast`
  void changeLastName(string) {
    nameLast = string;
  }

  /// Private function to load data
  /// from file to obtain name, picture, etc.
  /* Future<void> _loadData() async {
    try {
      final file = await _localFile;
      final contents = file;
    } catch (e) {
      return 0;
    }
  } */

  /// Private function to get local path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Private function to get local file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.json');
  }
}
