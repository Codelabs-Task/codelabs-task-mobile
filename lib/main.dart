import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jadwal_sholat/pages/home.dart';
import 'package:jadwal_sholat/services/RouterService.dart';


Future<void> main() async {

  initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
