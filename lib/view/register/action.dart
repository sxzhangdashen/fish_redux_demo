import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RegisterAction { action,regist,request,success,failure,loadData,querySuccess }

class RegisterActionCreator {
  static Action onAction() {
    return const Action(RegisterAction.action);
  }

  static Action loadData(){
    return Action(RegisterAction.loadData);
  }
  static Action regist(Map<String, String> input) {
    return Action(RegisterAction.regist,payload: input);
  }
  static Action request() {
    return Action(RegisterAction.request);
  }

  static Action success(dynamic json) {
    return Action(RegisterAction.success,payload: json);
  }

  static Action failure(dynamic errorInfo) {
    return Action(RegisterAction.failure,payload: errorInfo);
  }

  static Action querySuccess(dynamic json) {
    return Action(RegisterAction.querySuccess,payload: json);
  }
}
