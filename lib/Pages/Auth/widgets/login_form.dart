
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stock_pathshala/controller/login_controller.dart';
// import 'package:stock_pathshala/controller/Auth_Controller.dart';
import 'package:stock_pathshala/widget/primaryButton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter mobile number'),
              onChanged: (value) {
                loginController.phoneNumber.value = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginController.login,
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
