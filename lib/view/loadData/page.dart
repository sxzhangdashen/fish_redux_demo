import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class LoadDataPage extends Page<LoadDataState, Map<String, dynamic>> {
  LoadDataPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<LoadDataState>(
                adapter: null,
                slots: <String, Dependent<LoadDataState>>{
                }),
            middleware: <Middleware<LoadDataState>>[
            ],);

}
