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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Center(
                    child: Text(
                      'Phone Authentication',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      labelText: 'Enter mobile number',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      loginController.phoneNumber.value = value;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: loginController.login,
                  child: Text('Send OTP'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
