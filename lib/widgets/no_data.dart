import 'package:fishreduxdemo/config/zhyn_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataView extends StatefulWidget {


  final VoidCallback emptyRetry; //无数据事件处理

  NoDataView(this.emptyRetry);

  @override
  _NoDataViewState createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: double.infinity,
        child: InkWell(
          onTap: widget.emptyRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(405),
                height: ScreenUtil().setHeight(281),
                child: Image.asset('assets/images/no_data.png'),
              ),
              Text('暂无相关数据,轻触重试~',style: TextStyle(color: ZhynColor.appColor[40],fontSize: ScreenUtil().setSp(24)),)
            ],
          ),
        )
    );
  }
}