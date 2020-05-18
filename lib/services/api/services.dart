import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/view/register/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Services {

  static BaseOptions getOptions(String token)  {
    BaseOptions options=BaseOptions();
    options.baseUrl='后台请求地址';
    options.connectTimeout=25000;
    options.receiveTimeout=25000;
    options.headers['Authorization']=token;
    options.headers['accept']='application/json';
    return options;
  }


  static Dio request(String token){
    return Dio(getOptions(token));
  }

  static asyncRequest(
      Context ctx,
      Future<Response> Function() apiFuture,
      dynamic request,
      dynamic Function(dynamic) success,
      dynamic Function(RequestFailureInfo) failure) async {
    ctx.dispatch(request);
    try {
      final response = await apiFuture();
      if (response != null) {
        //根据实际项目中返回的状态码判断返回数据是否正确
        int code = response.data['code'];
        if (code == 0) {
          ctx.dispatch(success(response.data['data']));
        }
        else if(code == 401){
          Navigator.of(ctx.context).push(MaterialPageRoute(builder: (context) {
            return RegisterPage().buildPage(null);
          }));
        }
        else {
          final model = RequestFailureInfo(
            errorCode: response.data['code'],
            errorMsg: response.data['msg'],
          );
          print(response.data);
          ctx.dispatch(failure(model));
        }
      }
    } on DioError catch (e) {
      final model = RequestFailureInfo(
        errorCode: -1,
        errorMsg: '请求失败',
      );
      ctx.dispatch(failure(model));
    }
  }

}






class RequestFailureInfo {
  int errorCode;
  String errorMsg;

  RequestFailureInfo({this.errorCode, this.errorMsg});
}
