import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beatSeller/screens/auth/login_page.dart';
import 'package:beatSeller/screens/root_app.dart';

class AppRoute {
  static final AppRoute _singleton = AppRoute._internal();

  factory AppRoute() {
    return _singleton;
  }

  AppRoute._internal();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.id:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const LoginPage(),
        );
      case RootApp.id:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const RootApp(),
        );
      default:
        return _errorRoute();
    }
  }

  Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
      settings: const RouteSettings(
        name: '/error',
      ),
    );
  }
}
