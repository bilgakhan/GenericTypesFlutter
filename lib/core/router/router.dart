import 'package:app1/view/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerate {
  RouteGenerate._init();
  static final RouteGenerate _router = RouteGenerate._init();
  static RouteGenerate get router => _router;

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigator(const HomePage());
    }

    return null;
  }

  MaterialPageRoute _navigator(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
