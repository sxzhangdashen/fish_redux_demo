/*
 * @Author: zzj
 * @LastEditors: zzj
 * @Date: 2017-12-09 14:34:33
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_hour_glass_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class RefreshPage extends StatefulWidget {
  RefreshPage({Key key,
  @required this.refreshKey,
  this.enablePullUp: true,
  this.child,
  this.itemCount,
  this.itemBuilder,
  this.onRefresh,
  this.loadMore,
  this.noMoreText,
  this.loadText,
  this.loadReadyText,
  this.loadedText,
  this.loadingText,
  this.firstRefresh,
  }) : super(key: key);

  final GlobalKey<EasyRefreshState> refreshKey;
  final bool enablePullUp;
  final Widget child;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final OnRefresh onRefresh;
  final LoadMore loadMore;
  final String noMoreText;
  final String loadedText;
  final String loadReadyText;
  final String loadText;
  final String loadingText;
  final bool firstRefresh;

  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      key: widget.refreshKey,
      refreshHeader: BezierHourGlassHeader(key: _headerKey,backgroundColor: Colors.white,color: Colors.yellow,),
      // refreshFooter: ,
      refreshFooter: ClassicsFooter(key: _footerKey,
        loadText:widget.loadText==null?"上拉加载更多":widget.loadText,
        noMoreText:widget.noMoreText==null?"已经没有了":widget.noMoreText,
        loadedText: widget.loadedText==null?"已加载":widget.loadedText,
          loadReadyText:widget.loadReadyText==null?"准备加载":widget.loadReadyText,
          loadingText:widget.loadingText==null?"加载中":widget.loadingText,
        bgColor: Colors.white,
        textColor: Colors.black,
      ),
      firstRefresh: widget.firstRefresh==null?true:widget.firstRefresh,
      child: widget.child ?? new ListView.builder(
        shrinkWrap: true,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      ),
      onRefresh: widget.onRefresh,
      loadMore: widget.loadMore,
    );
  }
}