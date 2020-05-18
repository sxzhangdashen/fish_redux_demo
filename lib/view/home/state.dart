import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/widgets/load_state.dart';

class HomeState implements Cloneable<HomeState> {

  LoadState loadState=LoadState.State_Loading;

  @override
  HomeState clone() {
    return HomeState()
    ..loadState=loadState;
  }
}

HomeState initState(Map<String, dynamic> args) {
  HomeState state =HomeState()
  ..loadState;
  return state;
}
