import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class RegisterState implements Cloneable<RegisterState> {

  bool isLoading;
  List<DropdownMenuItem<String>> companyBussniessType =List();
  List<DropdownMenuItem<String>> companyFoucsType =List();
  List<DropdownMenuItem<String>> companySize =List();
  List<DropdownMenuItem<String>> companyAttendShows =List();

  @override
  RegisterState clone() {
    return RegisterState()
    ..isLoading=isLoading
    ..companyBussniessType=companyBussniessType
    ..companyFoucsType=companyFoucsType
    ..companySize=companySize
    ..companyAttendShows=companyAttendShows;
  }
}

RegisterState initState(Map<String, dynamic> args) {
  RegisterState state=RegisterState()
  ..isLoading
  ..companyBussniessType
  ..companyFoucsType
  ..companySize
  ..companyAttendShows;
  return state;
}
