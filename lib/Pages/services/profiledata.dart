import 'package:flutter/material.dart';
import 'dart:io';
/// Class to handle data loading of profile
/// Should handle pictures, user data, etc.
class ProfileData{
  ProfileData(){
    _loadData();
  }
  String nameFirst = "Test";
  String nameLast = "Test";
  File image = File("");
  late Image profilePicture;
  /// Function to get image location
  File getImage(){
    return image;
  }
  /// Function to obtain first name
  /// as a string
  String getFirstName(){
    return nameFirst;
  }
  /// Function to obtain last name
  /// as a string
  String getLastName(){
    return nameLast;
  }
  /// Function to change `nameFirst`
  void changeFirstName(string){
    nameFirst = string;
  }
  /// Function to change `nameLast`
  void changeLastName(string){
    nameLast = string;
  }
  /// Private function to load data
  /// from file to obtain name, picture, etc.
  void _loadData(){

  }
}