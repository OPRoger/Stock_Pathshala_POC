import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pathshala/controller/OTP_controller.dart';
import 'package:stock_pathshala/controller/login_controller.dart';

class OTPVerificationPage extends StatelessWidget {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: loginController.otpText,
              decoration: InputDecoration(labelText: 'Enter OTP'),
              // onChanged: (value) {
              //   otpController.otp.value = value;
              // },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginController.verifyOTP,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
