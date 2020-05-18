import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/generated/l10n.dart';
import 'package:fishreduxdemo/widgets/load_state.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoadDataState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(S.of(viewService.context).home),
      ),

      body: LoadStateLayout(
        state: state.loadState,
        //无数据时操作
        emptyRetry: (){

        },
        //错误时操作
        errorRetry: (){

        },
        //视图成功后返回
        successWidget: GestureDetector(
            child: _body(state,dispatch,viewService)
        ),
      )
  );
}

Widget _body(LoadDataState state, Dispatch dispatch, ViewService viewService){
  return SingleChildScrollView(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

        ],
      ),
    ),
  );
}
