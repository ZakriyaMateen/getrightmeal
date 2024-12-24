import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/constants/AppKeys.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';
import 'package:getrightmeal/views/dashboard/HomeScreen.dart';
import 'package:getrightmeal/views/dashboard/ProfileScreen.dart';
import 'package:getrightmeal/views/signupAndLogin/VerifyOtpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/UserProfileModel.dart';
import '../../constants/AppUrls.dart';
import '../../constants/Colors.dart';

class LoginPageController extends GetxController{

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  late UserProfileModel userProfileModel ;

  void validate()async{
    if(formKey.currentState!.validate()){

      await postData();
    }
  }
  Future postData()async{

    final uri = Uri.parse(AppUrls.baseUrl+AppUrls.getOtp);

    try{
      isLoading.value = true;
      final response = await http.post(
          uri,
          body: _buildBody(),
        // headers: {
        //   'Content-Type': 'application/json',
        // }

      );
      var data = await jsonDecode(response.body);

      if(response.statusCode==201) {
        Get.to(OtpVerificationScreen(email: emailController.text));

      }

      // AccessTokenController controller = Get.find();
      //
      // if(response.statusCode==201){
      //
      //
      //   SharedPreferences pref = await SharedPreferences.getInstance();
      //
      //   await pref.setString(AppKeys.access_token, data[AppKeys.access_token]);
      //   await pref.setString(AppKeys.emailFromForm, emailController.text);
      //   await pref.setString(AppKeys.passwordFromForm, passwordController.text);
      //   await pref.setInt(AppKeys.userId, userProfileModel.id!??3);
      //
      //   controller.setAccessToken(data[AppKeys.access_token]);
      //   controller.setEmail(emailController.text);
      //   // controller.setUserId(data['id']??3);
      //
      //   isLoading.value = false;
      //   Get.to(CustomBottomNavBar());

      else if(response.statusCode == 400){
        Get.snackbar(
          'Invalid Creds!',
          'Please try again with correct credentials',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: black,
          colorText:plumGrey,
          duration: Duration(seconds: 5),
        );
      }
      else {
        Get.snackbar(
          'Oops!',
          'Please try again later',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: black,
          colorText:plumGrey,
          duration: Duration(seconds: 5),
        );
      }
      isLoading.value = false;

    }
    catch(e){
      isLoading.value = false;
      print("Login Page Controller Error : "+e.toString());
    }
  }

  _buildBody (){
    return {
      'email':emailController.text,
    };
  }


}