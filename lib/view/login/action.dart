import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoginAction { login,request,success,failure,toRegisterPage,changeLoading, }

class LoginActionCreator {

  static Action login(Map<String,dynamic> map) {
    return Action(LoginAction.login,payload: map);
  }
  static Action request() {
    return Action(LoginAction.request);
  }

  static Action success(dynamic json) {
    return Action(LoginAction.success,payload: json);
  }

  static Action failure(dynamic errorInfo) {
    return Action(LoginAction.failure,payload: errorInfo);
  }

  static Action toRegisterPage() {
    return Action(LoginAction.toRegisterPage);
  }

  static Action changeLoading(){
    return Action(LoginAction.changeLoading);
  }
}
