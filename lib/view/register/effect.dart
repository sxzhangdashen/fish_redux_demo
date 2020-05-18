import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/services/api/services.dart';
import 'package:fishreduxdemo/services/request/user_respository.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<RegisterState> buildEffect() {
  return combineEffects(<Object, Effect<RegisterState>>{
    RegisterAction.regist: _regist,
    RegisterAction.success:_success,
    RegisterAction.failure:_failure,
  });
}



void _regist(Action action, Context<RegisterState> ctx) {
//  FormData formData= FormData.fromMap(action.payload);
//  Services.asyncRequest(
//      ctx,
//          () => UserRespository.regist(formData: formData),
//      RegisterActionCreator.request(),
//          (json) => RegisterActionCreator.success(json),
//          (errorInfo) => RegisterActionCreator.failure(errorInfo));
}


void _success(Action action, Context<RegisterState> ctx) {
  print("跳转页面操作");
}

void _failure(Action action, Context<RegisterState> ctx) {
  print(action.payload);
}
