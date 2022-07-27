import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

/// Class to handle data loading of profile
/// Should handle pictures, user data, etc.
class ProfileData {
  Map data = {
    "nameFirst": "Anonymous",
    "nameLast": " ",
    "birthday": " ",
    "gender": " ",
    "imagePath": " ",
    "tags": [],
  };

  /// Function to get image location.
  String getImage() {
    return data["imagePath"];
  }

  /// Function to get `tags`.
  List<String> getTags(){
    return List<String>.from(data["tags"]);
  }

  /// Function to obtain first name.
  /// as a string
  String getFirstName() {
    return data["nameFirst"];
  }

  /// Function to obtain last name.
  /// as a string
  String getLastName() {
    return data["nameLast"];
  }

  /// Function to obtain birthday.
  /// as a string
  String getBirthday() {
    return data["birthday"];
  }

  /// Function to get gender.
  String getGender(){
    return data["gender"];
  }

  /// Function to change `nameFirst`.
  void changeFirstName(string) {
    data["nameFirst"] = string;
  }

  /// Function to change `nameLast`.
  void changeLastName(string) {
    data["nameLast"] = string;
  }

  /// Function to change `birthday`.
  void changeBirthday(string){
    data["birthday"] = string;
  }

  /// Function to change profile image 
  /// location.
  void changeImage(string){
    data["imagePath"] = string.substring(1);
  }

  /// Function to change `tags`.
  void changeTags(list){
    data["tags"] = list;
  }
  
  /// Function to change `gender`.
  void changeGender(string){
    data["gender"] = string;
  }

  /// Private function to load data
  /// from file to obtain name, picture, etc.
  Future<String> _loadData() async {
    try {
      File file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      writeFile();
      File file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    }
  }

  /// Private function to get local path.
  Future<String> get _localPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Private function to get local file.
  Future<File> get _localFile async {
    String path = await _localPath;
    return File('$path/data.txt');
  }

  /// Function to save data to file.
  Future<File> writeFile() async {
    File file = await _localFile;
    // Write the file.
    return file.writeAsString(json.encode(data));
  }
  /// Function to load data into object.
  Future<void> loadClass() async{
    String temp = await _loadData();
    data = Map.castFrom(jsonDecode(temp));
  }
}
