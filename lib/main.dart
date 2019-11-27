import 'package:flutter/material.dart';
import 'package:flutter_base/ui/page/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'config/provider_manager.dart';
import 'config/router_config.dart';
import 'config/storage_manager.dart';
import 'config/ui_adapter_config.dart';
import 'generated/i18n.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  /// 全局屏幕适配方案
  InnerWidgetsFlutterBinding.ensureInitialized()
    ..attachRootWidget(App(future: StorageManager.init()))
    ..scheduleWarmUpFrame();
}

class App extends StatelessWidget {
  /// 在App运行之前,需要初始化的异步操作
  /// 如果存在多个,可以使用[Future.wait(futures)]来合并future后传入
  final Future future;

  App({this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      /// 在异步操作时,显示的页面
//      if (snapshot.connectionState != ConnectionState.done) {
//        return SplashPage();
//      }

      return OKToast(
          child: MultiProvider(
            providers: providers,
            child: RefreshConfiguration(
              hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: Router.generateRoute,
                initialRoute: RouteName.home,
              ),
            ),
          ));
    });
  }
}
