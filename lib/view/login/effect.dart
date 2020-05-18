import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/services/api/services.dart';
import 'package:fishreduxdemo/services/request/user_respository.dart';
import 'package:fishreduxdemo/util/datautil.dart';
import 'package:fishreduxdemo/view/home/page.dart';
import 'package:fishreduxdemo/view/register/page.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import '../../root.dart';
import 'action.dart';
import 'state.dart';

Effect<LoginState> buildEffect() {
  return combineEffects(<Object, Effect<LoginState>>{
//    Lifecycle.initState:_init,
    LoginAction.login: _login,
    LoginAction.success:_success,
    LoginAction.toRegisterPage:_toRegisterPage,
  });
}


void _login(Action action, Context<LoginState> ctx) {
  ctx.dispatch(LoginActionCreator.changeLoading());
  //  final FormData formData = FormData.fromMap(<String, dynamic>{
//    'email': ctx.state.email,
//    'password': ctx.state.password
//  });
//  Services.asyncRequest(
//      ctx,
//          () => UserRespository.login(formData: formData),
//      LoginActionCreator.request(),
//          (json) => LoginActionCreator.success(json),
//          (errorInfo) => LoginActionCreator.failure(errorInfo));


  //这里是请求后台数据，成功后跳转页面，这里我就模拟登录了
  delay(2000);
  Navigator.of(ctx.context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => HomePage().buildPage(null)
      ), (route) => route == null);


}

void _success(Action action, Context<LoginState> ctx) {
  DataUtil.saveLoginInfo(action.payload['user']);
  DataUtil.saveToken(action.payload['token']);
  ctx.state.formKey.currentState.dispose();
  ctx.dispatch(LoginActionCreator.changeLoading());
  Navigator.of(ctx.context).pushAndRemoveUntil(
      new MaterialPageRoute(builder: (context) => HomePage().buildPage(null)
      ), (route) => route == null);
}

void _toRegisterPage(Action action, Context<LoginState> ctx){
  Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
    return RegisterPage().buildPage(null);
  }));
}
