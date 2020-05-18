import 'package:fishreduxdemo/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DataUtil {
  static final String SP_ID = 'id';
  static final String SP_TOKEN = 'token';
  static final String SP_EMAIL = 'email';
  static final String SP_FIRSTNAME = 'first_name';
  static final String SP_LASTNAME = 'last_name';
  static final String SP_TITLE = 'title';
  static final String SP_PHONE = 'phone';
  static final String SP_ISLOGIN="false";

  static saveLoginInfo(Map data) async {
    if (data != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      int id = data[SP_ID];
      await sp.setInt(SP_ID, id);
      String email = data[SP_EMAIL];
      await sp.setString(SP_EMAIL, email);
      String firstName = data[SP_FIRSTNAME];
      await sp.setString(SP_FIRSTNAME, firstName);
      String lastName = data[SP_LASTNAME];
      await sp.setString(SP_LASTNAME, lastName);
      String title = data[SP_TITLE];
      await sp.setString(SP_TITLE, title);
      String phone = data[SP_PHONE];
      await sp.setString(SP_PHONE, phone);
      await sp.setBool(SP_ISLOGIN, true);
    }
  }

  static clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(SP_ID, '');
    await sp.setString(SP_TOKEN, '');
    await sp.setString(SP_EMAIL, '');
    await sp.setString(SP_FIRSTNAME, '');
    await sp.setString(SP_LASTNAME, "");
    await sp.setString(SP_TITLE, "");
    await sp.setString(SP_PHONE, "");
  }


  static Future<User> getLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool(SP_ISLOGIN);
    if (islogin == null || islogin == false) {
      return null;
    }
    User user = User();
    user.id=sp.getInt(SP_ID);
    user.email=sp.getString(SP_EMAIL);
    user.first_name=sp.getString(SP_FIRSTNAME);
    user.last_name=sp.getString(SP_LASTNAME);
    user.title=sp.getString(SP_TITLE);
    user.phone=sp.getString(SP_PHONE);
    return user;
  }

  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool(SP_ISLOGIN);
    return isLogin != null && isLogin;
  }

  static Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_TOKEN);
  }

  static clearToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(SP_TOKEN, '');
  }

  static void saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(SP_TOKEN, token);
  }


}



