import 'package:fish_redux/fish_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'action.dart';
import 'state.dart';

Reducer<LoginState> buildReducer() {
  return asReducer(
    <Object, Reducer<LoginState>>{
      LoginAction.changeLoading: _changeLoading,
      LoginAction.failure:_failure,
    },
  );
}

LoginState _changeLoading(LoginState state, Action action) {
  final LoginState newState = state.clone();
  newState.isLoading=!state.isLoading;
  return newState;
}

LoginState _failure(LoginState state, Action action) {
  final LoginState newState = state.clone();
  Fluttertoast.showToast(msg: action.payload.errorMsg,gravity: ToastGravity.CENTER);
  newState.isLoading=!state.isLoading;
  return newState;
}

