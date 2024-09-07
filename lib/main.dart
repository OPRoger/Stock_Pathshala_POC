import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stock_pathshala/Pages/Auth/auth_page.dart';
import 'package:stock_pathshala/config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      home: const AuthPage(),
    );
  }
}
