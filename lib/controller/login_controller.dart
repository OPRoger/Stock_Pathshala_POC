import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:stock_pathshala/Pages/OTPverification/OTPverification_page.dart';

class LoginController extends GetxController{
  var phoneNumber = ''.obs;

  Future<void> login() async {
    var url = 'https://internal.stockpathshala.in/api/v1/login-register';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "user_name": phoneNumber.value,
        "hash_code": "96pYMmXfHNR"
      }),
    );
    if (response.statusCode == 200) {
      Get.to(OTPVerificationPage(phoneNumber.value));
    } else {
      Get.snackbar("Error", "Failed to send OTP");
    }
  }
}