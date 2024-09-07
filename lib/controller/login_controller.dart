import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_pathshala/Pages/ClassListingPage/ClassListing_Page.dart';
import 'dart:convert';

import 'package:stock_pathshala/Pages/OTPverification/OTPverification_page.dart';

class LoginController extends GetxController{
  TextEditingController otpText = TextEditingController();
  var phoneNumber = ''.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


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
      Get.to(OTPVerificationPage());
    } else {
      Get.snackbar("Error", "Failed to send OTP");
    }
  }

  Future<void> verifyOTP() async {
    String otp = otpText.text;  // Fetch OTP directly from the TextEditingController
    if (otp.isEmpty) {
      Get.snackbar("Error", "Please enter the OTP");
      return;
    }
    var url = 'https://internal.stockpathshala.in/api/v1/verify-login-register';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "user_name": phoneNumber.value,
        "otp": otp// Use the otp fetched from the TextController
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      if(json['status']==true){
        // var prefs = await SharedPreferences.getInstance();
        var accessToken = json['token'];
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('token', accessToken);
        Get.to(ClassListingPage());
        otpText.clear();
      }else {
        Get.snackbar("Error", "Invalid OTP");
      }

    }
    // else {
    //   Get.snackbar("Error", "Invalid OTP");
    // }
  }
}

