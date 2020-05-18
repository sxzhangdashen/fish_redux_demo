import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/config/zhyn_colors.dart';
import 'package:fishreduxdemo/generated/l10n.dart';
import 'package:fishreduxdemo/view/loadData/page.dart';
import 'package:fishreduxdemo/widgets/load_state.dart';
import 'package:flutter/material.dart';

import '../../root.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
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


Widget _body(HomeState state, Dispatch dispatch, ViewService viewService){
  return SingleChildScrollView(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _sheZhi(state,dispatch,viewService),
          SizedBox(height: 20),
          _data(state,dispatch,viewService),
        ],
      ),
    ),
  );
}

Widget _data(HomeState state, Dispatch dispatch, ViewService viewService){
  return RaisedButton(
    onPressed: (){
      Navigator.of(viewService.context).push(MaterialPageRoute(builder: (context) {
        return LoadDataPage().buildPage(null);
      }));
    },
    shape: StadiumBorder(side: BorderSide.none),
    color: ZhynColor.appColor[40],
    child: Text(
      "数据加载动画",
      style: TextStyle(color: Colors.white,fontSize: 15),
    ),
  );
}


Widget _sheZhi(HomeState state, Dispatch dispatch, ViewService viewService){
  return RaisedButton(
    onPressed: (){
      Navigator.of(viewService.context).push(MaterialPageRoute(builder: (context) {
        return Root();
      }));
    },
    shape: StadiumBorder(side: BorderSide.none),
    color: ZhynColor.appColor[40],
    child: Text(
      "设置",
      style: TextStyle(color: Colors.white,fontSize: 15),
    ),
  );
}
