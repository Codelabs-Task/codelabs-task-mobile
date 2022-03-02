import 'package:flutter/material.dart';
import 'package:jadwal_sholat/pages/Date.dart';
import 'package:jadwal_sholat/pages/detail.dart';
import 'package:jadwal_sholat/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // jika ingin mengirim argument
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/date':
        return MaterialPageRoute(builder: (_) => Date());
        case '/detail':
        return MaterialPageRoute(builder: (_) => Detail(args:settings.arguments));
    // return MaterialPageRoute(builder: (_) => AboutPage(args));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}