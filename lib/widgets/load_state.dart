//四种视图状态
import 'package:fishreduxdemo/config/zhyn_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'no_data.dart';

enum LoadState { State_Success, State_Error, State_Loading, State_Empty }

///根据不同状态来展示不同的视图
class LoadStateLayout extends StatefulWidget {

  final LoadState state; //页面状态
  final Widget successWidget;//成功视图
  final VoidCallback errorRetry; //错误事件处理
  final VoidCallback emptyRetry; //空数据事件处理

  LoadStateLayout(
      {Key key,
        this.state = LoadState.State_Loading,//默认为加载状态
        this.successWidget,
        this.errorRetry,
        this.emptyRetry
      })
      : super(key: key);

  @override
  _LoadStateLayoutState createState() => _LoadStateLayoutState();
}

class _LoadStateLayoutState extends State<LoadStateLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //宽高都充满屏幕剩余空间
      width: double.infinity,
      height: double.infinity,
      child: _buildWidget,
    );
  }

  ///根据不同状态来显示不同的视图
  Widget get _buildWidget {
    switch (widget.state) {
      case LoadState.State_Success:
        return widget.successWidget;
        break;
      case LoadState.State_Error:
        return _errorView;
        break;
      case LoadState.State_Loading:
        return _loadingView;
        break;
      case LoadState.State_Empty:
        return NoDataView(widget.emptyRetry);
        break;
      default:
        return null;
    }
  }

  ///加载中视图
  Widget get _loadingView {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Container(
        height: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: Image.asset('assets/images/cargo_loading.gif'),
            ),
            Text('拼命加载中...',style: TextStyle(color: ZhynColor.appColor[40],fontSize: ScreenUtil().setSp(24)),)],
        ),
      ),
    );
  }

  ///错误视图
  Widget get _errorView {
    return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: InkWell(
          onTap: widget.errorRetry,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(405),
                height: ScreenUtil().setHeight(317),
                child: Image.asset('assets/images/load_error.png'),
              ),
              Text("加载失败，请轻触重试!",style: TextStyle(color: ZhynColor.appColor[40],fontSize: ScreenUtil().setSp(24)),),
            ],
          ),
        )
    );
  }
}