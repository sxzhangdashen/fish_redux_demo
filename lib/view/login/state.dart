import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginState implements Cloneable<LoginState> {

  bool isLoading=false;
  String email;
  String password;
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  LoginState clone() {
    return LoginState()
    ..isLoading=isLoading
    ..email=email
    ..password=password
    ..formKey=formKey;
  }
}

LoginState initState(Map<String, dynamic> args) {
  LoginState state=LoginState()
  ..isLoading
  ..email
  ..password
  ..formKey;
  return state;
}
