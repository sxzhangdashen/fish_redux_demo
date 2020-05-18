import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    Lifecycle.initState:_init,
  });
}


void _init(Action action, Context<HomeState> ctx) {
  ctx.dispatch(HomeActionCreator.onAction());
}

