import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<LoadDataState> buildEffect() {
  return combineEffects(<Object, Effect<LoadDataState>>{
    Lifecycle.initState:_init,
  });
}


void _init(Action action, Context<LoadDataState> ctx) {
  ctx.dispatch(LoadDataActionCreator.onAction());
}

