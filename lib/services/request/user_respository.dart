

import 'package:dio/dio.dart';
import 'package:fishreduxdemo/services/api/services.dart';

class UserRespository{
  //登录
  static Future<Response> login({FormData formData})   async {
    return Services.request(null).post('/api/login',data: formData);
  }

  //注册
  static Future<Response> regist({FormData formData})   async {
    return Services.request(null).post('/api/register',data: formData);
  }



}