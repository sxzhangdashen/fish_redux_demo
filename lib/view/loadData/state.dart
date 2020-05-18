import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/widgets/load_state.dart';

class LoadDataState implements Cloneable<LoadDataState> {

  LoadState loadState=LoadState.State_Loading;
  @override
  LoadDataState clone() {
    return LoadDataState()
    ..loadState=loadState;
  }
}

LoadDataState initState(Map<String, dynamic> args) {
  LoadDataState state=LoadDataState()
  ..loadState;
  return state;
}
