
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
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter mobile number'),
              onChanged: (value) {
                loginController.phoneNumber.value = value;
              },
            ),

            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                PrimaryButton(
                  BtName: "Login",
                  icon: Icons.lock_open,
                  ontap: () {
                    loginController.login();
                    // authController.isLogin(authController.emailController.text, authController.passwordController.text);
                    // Get.offAllNamed("/homePage");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
