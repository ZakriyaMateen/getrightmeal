import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage3.dart';
import 'package:http/http.dart'as http;


class RegisterPage2Controller extends GetxController{
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  var isLoading = false.obs;

    Future postData ()async{
      Get.to(RegisterPage3());
    }
  Map<String, dynamic> buildBody(int goal, List prefs, int activityLevel, String uid) {
    return {
      'activityLevel': activityLevel,                        // Keep as int
      'dairyPreferences': prefs,                             // Send List as-is
      'cuisinePreferences': [1],                             // Example List
      'goal': goal,                                          // Keep as int
      'id': uid,                                             // Already a string
      'gender': genderController.text,                       // Send gender as string
      'dateOfBirth': dobController.text,                     // Ensure the date is a valid string (e.g., "YYYY-MM-DD")
      'height': int.parse(heightController.text),            // Convert to int
      'weight': int.parse(weightController.text),            // Convert to int
      'phone': phoneController.text,                         // Keep as string
    };
  }

}