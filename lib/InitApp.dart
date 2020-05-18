import 'dart:io';

import 'package:fishreduxdemo/view/login/page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class InitApp extends StatefulWidget {

  InitApp({Key key}) : super(key: key);
  @override
  _InitAppState createState() => _InitAppState();

}
class _InitAppState extends State<InitApp>{

  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //PX屏幕适配
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      child: LoginPage().buildPage(null),
    );
  }



}