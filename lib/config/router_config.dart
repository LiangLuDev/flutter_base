import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/ui/page/home_page.dart';
import 'package:flutter_base/ui/page/splash_page.dart';
import 'package:flutter_base/ui/widget/page_route_anim.dart';

class RouteName {
  static const String splash = 'splash';
  static const String home = '/';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouteName.home:
        return NoAnimRouteBuilder(HomePage());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}