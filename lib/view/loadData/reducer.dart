import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/widgets/load_state.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoadDataState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoadDataState>>{
      LoadDataAction.action: _onAction,
    },
  );
}

LoadDataState _onAction(LoadDataState state, Action action) {
  final LoadDataState newState = state.clone();
  newState.loadState=LoadState.State_Loading;
  return newState;
}
