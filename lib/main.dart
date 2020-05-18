import 'package:fishreduxdemo/InitApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/storage_manager.dart';
import 'generated/l10n.dart';
import 'model/locale_model.dart';
import 'model/theme_model.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  await StorageManager.init();
  runApp(MyApp());

  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider(
        providers: <SingleChildWidget>[
          ChangeNotifierProvider.value(value: ThemeModel()),//主题 provider
          ChangeNotifierProvider.value(value: LocaleModel()),//本地语种 provider
        ],
        child: Consumer2<ThemeModel, LocaleModel>(
          builder:
              (BuildContext context, themeModel, localeModel, Widget child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: themeModel.themeData(),
                darkTheme: themeModel.themeData(platformDarkMode: true),
                locale: localeModel.locale,
                localizationsDelegates: [
                  S.delegate,//支持语种对应的字段
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales, //支持的语种
                //路由自行配置 flutter自带 或者 fluro
                onGenerateRoute: null,
                home: InitApp(),
            );
          },
        ),
      ),
    );
  }
}
