import 'package:fish_redux/fish_redux.dart';
import 'package:fishreduxdemo/generated/l10n.dart';
import 'package:fishreduxdemo/widgets/auth_button_loading_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(LoginState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(S.of(viewService.context).home),
        ),

        body: GestureDetector(
            onTap: (){
              FocusScope.of(viewService.context).requestFocus(FocusNode());
            },
            child: _body(state,dispatch,viewService)
        )
  );
}


Widget _body(LoginState state, Dispatch dispatch,ViewService viewService){
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
                    _title(state,dispatch,viewService),
                  ]),
                ),
              ]
          )
          ),
        ],));
}

Widget _title(LoginState state,Dispatch dispatch,ViewService viewService){
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
                      border:Border(bottom:BorderSide(width: ScreenUtil.getInstance().setWidth(10),
                        color: Theme.of(viewService.context).accentColor,)),
                    ),
                    child: Text("登录",
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
              child:RichText(text: TextSpan(
                  text: "使用",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(26),
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                     TextSpan(
                        text: ' 邮箱',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().setSp(26),
                        )),
                     TextSpan(
                        text: ' 登录',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(26),
                          color: Colors.red,
                        )),
                  ]
              ),)
          ),
          Container(
            margin: EdgeInsets.only(
              top: ScreenUtil.getInstance().setWidth(50)
            ),
            child: FormBuilder(
              key: state.formKey,
              initialValue: {
                'date': DateTime.now(),
                'accept_terms': false,
              },
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(80),
                        right: ScreenUtil.getInstance().setWidth(80)
                    ),
                    child: FormBuilderTextField(
                      initialValue: "zzjtest@163.com",
                      attribute: 'email',
                      maxLines: 1,
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                      decoration: InputDecoration(labelText: "请输入账号"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil.getInstance().setWidth(80),
                        right: ScreenUtil.getInstance().setWidth(80)
                    ),
//                    padding: EdgeInsets.only(
//                      top: ScreenUtil.getInstance().setWidth(80),
//                      bottom: ScreenUtil.getInstance().setWidth(80),
//                    ),
                    child: FormBuilderTextField(
                      initialValue: "123456",
                      attribute: 'password',
                      obscureText: true,
                      maxLines: 1,
                      validators: <String Function(dynamic)>[
                        FormBuilderValidators.maxLength(20),
                        FormBuilderValidators.required(),
                      ],
                      decoration: InputDecoration(labelText: "请输入密码"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil.getInstance().setWidth(80.0),
              top: ScreenUtil.getInstance().setWidth(80.0),
              right: ScreenUtil.getInstance().setWidth(80.0),
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(80.0),
//              color: ZynColor.appColor[40],
              color: Theme.of(viewService.context).accentColor,
              child: MaterialButton(
                  minWidth: MediaQuery.of(viewService.context).size.width,
                  height: 50,
                  // padding: const EdgeInsets.fromLTRB(
                  //     20.0, 15.0, 20.0, 15.0),
                  onPressed: () async {
                    state.formKey.currentState.save();
                    if (state.formKey.currentState.validate()) {
                      final Map<String, String> input = state.formKey
                          .currentState.value
                          .map((dynamic key, dynamic value) =>
                          MapEntry<String, String>(
                              key, value.toString()));
                      state.email=input['email'];
                      state.password=input['password'];
                      dispatch(LoginActionCreator.login(input));
                    }
                  },
                  child: AuthButtonLoadingScaffold(
                    isLoading: state.isLoading,
                    buttonHeight: 50,
                  )
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
                    child: Text("没有账号?",),
                  )
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      dispatch(LoginActionCreator.toRegisterPage());
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
                      child: Text("去注册",style: TextStyle(color:Colors.orange)),
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
