import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action,changeState }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action changeState() {
    return Action(HomeAction.changeState);
  }
}
