import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pathshala/controller/OTP_controller.dart';

class OTPVerificationPage extends StatelessWidget {
  final OTPController otpController;

  OTPVerificationPage(String phoneNumber)
      : otpController = Get.put(OTPController(phoneNumber));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter OTP'),
              onChanged: (value) {
                otpController.otp.value = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: otpController.verifyOTP,
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}