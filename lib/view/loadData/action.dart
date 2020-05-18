import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum LoadDataAction { action }

class LoadDataActionCreator {
  static Action onAction() {
    return const Action(LoadDataAction.action);
  }
}
