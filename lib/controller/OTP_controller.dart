
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_pathshala/Pages/ClassListingPage/ClassListing_Page.dart';

class OTPController extends GetxController {
  var otp = ''.obs;
  final String phoneNumber;

  OTPController(this.phoneNumber);

  Future<void> verifyOTP() async {
    var url = 'https://internal.stockpathshala.in/api/v1/verify-login-register';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "user_name": phoneNumber,
        "otp": otp.value
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var accessToken = data['access_token'];
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', accessToken);
      Get.to(ClassListingPage());
    } else {
      Get.snackbar("Error", "Invalid OTP");
    }
  }
}