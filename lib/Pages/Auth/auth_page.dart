
import 'package:flutter/material.dart';
import 'package:stock_pathshala/Pages/Auth/widgets/Auth_Page_Body.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:const  [
              Padding(
                padding:  EdgeInsets.only(top: 60.0),
                child:
                // WelcomeHead(),
                Text("StockPathshala")
              ),
              SizedBox(
                height: 20,
              ),
              AuthPageBody()
            ],
          ),
        ),
      ),
    );
  }
}
