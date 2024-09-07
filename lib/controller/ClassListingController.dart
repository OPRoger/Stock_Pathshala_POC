import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ClassListingController extends GetxController {
  var classes = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchClasses();
  }

  Future<void> fetchClasses() async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('accessToken') ?? '';
    var url = 'https://internal.stockpathshala.in/api/v1/live_classes';

    var response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      classes.value = data['classes'];
    } else {
      Get.snackbar("Error", "Failed to fetch classes");
    }
  }
}