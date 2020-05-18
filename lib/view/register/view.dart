import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/config/zhyn_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RegisterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
//          title: Text(S.of(viewService.context).darkMode),
      ),

      body: GestureDetector(
          onTap: (){
            FocusScope.of(viewService.context).requestFocus(FocusNode());
          },
          child: _body(state,dispatch)
      )
  );
}


Widget _body(RegisterState state, Dispatch dispatch){
  ScrollController _scrollController = ScrollController();
  return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child:CustomScrollView(
              controller:_scrollController,
              slivers:<Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(<Widget>[
                    _title(state,dispatch),
                  ]),
                ),
              ]
          )
          ),
        ],));
}

Widget _title(RegisterState state,Dispatch dispatch){
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  return Column(
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(80.0),
                top: ScreenUtil.getInstance().setWidth(50.0),
                right: ScreenUtil.getInstance().setWidth(80.0),
              ),
              alignment: Alignment.centerLeft,
              child:Column(
                children: <Widget>[
                  Container(
                    decoration:BoxDecoration(
                      //设置四周边框
                      border:Border(bottom:BorderSide(width: ScreenUtil.getInstance().setWidth(10),color: Colors.red)),
                    ),
                    child: Text("Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil.getInstance().setSp(55)
                      ),),
                  )

                ],
              )
          ),
          Container(
              margin: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(80.0),
                top: ScreenUtil.getInstance().setWidth(20.0),
                right: ScreenUtil.getInstance().setWidth(80.0),
              ),
              alignment: Alignment.centerLeft,
              child:Row(
                children: <Widget>[
                  Text("Use",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26)
                    ),),
                  Text(" email ",
                    style: TextStyle(
                        color: ZhynColor.appColor[40],
                        fontSize: ScreenUtil.getInstance().setSp(26)
                    ),),
                  Text("to login ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(26)
                    ),)
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil.getInstance().setWidth(50),
                left: ScreenUtil.getInstance().setWidth(80),
                right: ScreenUtil.getInstance().setWidth(80)
            ),
            child: FormBuilder(
              key: _fbKey,
              initialValue: {
                'date': DateTime.now(),
                'accept_terms': false,
              },
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Container(
                    child: FormBuilderTextField(
                      initialValue: "zzjtest@163.com",
                      attribute: 'email',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                      decoration: InputDecoration(labelText: "Enter email"),
                    ),
                  ),
                  Container(
                    child: FormBuilderTextField(
                      initialValue:"123456",
                      attribute: 'password',
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.maxLength(20),
                        FormBuilderValidators.required(),
                      ],
                      decoration: InputDecoration(labelText: "Enter password"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: ScreenUtil.getInstance().setWidth(80),
            margin: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(80.0),
              top: ScreenUtil.getInstance().setWidth(80.0),
              right: ScreenUtil.getInstance().setWidth(80.0),
            ),
            child: RaisedButton(
              onPressed: (){
                _fbKey.currentState.save();
                if (_fbKey.currentState.validate()) {
                  final Map<String, String> input = _fbKey
                      .currentState.value
                      .map((dynamic key, dynamic value) =>
                      MapEntry<String, String>(
                          key, value.toString()));
                  dispatch(RegisterActionCreator.regist(input));
                }
              },
              shape: StadiumBorder(side: BorderSide.none),
              color: ZhynColor.appColor[40],
              child: Text(
                "注册",
                style: TextStyle(color: Colors.white,fontSize: 15),
              ),
            ),
          ),
          GestureDetector(
              onTap: (){

              },
              child: Container(
                margin: EdgeInsets.only(
                    top: ScreenUtil.getInstance().setWidth(80)
                ),
                child: Text("忘记密码?",style: TextStyle(color:Colors.orange)),
              )
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(30)
                      ),
                      child: Text("我有账号",),
                    )
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
//                        dispatch(LoginActionCreator.toRegisterPage());
                      },
                      child: Container(
//                      decoration:BoxDecoration(
//                        //设置四周边框
//                        border:Border(bottom:BorderSide(width: ScreenUtil.getInstance().setWidth(1),color: Colors.orange)),
//                      ),
                        margin: EdgeInsets.only(
                          top: ScreenUtil.getInstance().setWidth(30),
                          right:  ScreenUtil.getInstance().setWidth(80),
                        ),
                        child: Text("登录",style: TextStyle(color:Colors.orange)),
                      ),
                    )
                )

              ],

            ),
          )


        ],
      ),
    ],
  );
}
