import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stock_pathshala/Pages/Auth/widgets/login_form.dart';
import 'package:stock_pathshala/config/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/ClassListingPage/ClassListing_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('accessToken');

  runApp(MyApp(token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp(this.isLoggedIn);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: isLoggedIn ? ClassListingPage() : LoginForm(),
    );
  }
}
