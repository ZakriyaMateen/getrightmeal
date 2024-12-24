import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/Models/UserModel.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:getrightmeal/views/signupAndLogin/LoginPage.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage2.dart';
import 'package:getrightmeal/views/signupAndLogin/VerifyOtpScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/AppKeys.dart';
import '../../constants/Colors.dart';
import '../../views/signupAndLogin/VerifyOtpScreenFromRegister.dart';


class RegisterPage1Controller extends GetxController{


  RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();
  RxBool isObsecure = true.obs;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isChecked = false.obs;

  void toggleIsChecked (bool val){
    isChecked.value = val;
  }

  void togglePassword (){
    isObsecure.value = !isObsecure.value;
  }

  Future postData()async{

        final uri = Uri.parse(AppUrls.baseUrl+AppUrls.register);

        try{
          isLoading.value = true;

          final response = await http.post(
            uri,
            body: _buildBody()
          );

         if(response.statusCode == 201){
           var data = jsonDecode(response.body);
           UserModel userModel = UserModel.fromJson(data);

            print(data);
           SharedPreferences pref = await SharedPreferences.getInstance();


           await pref.setString(AppKeys.emailFromForm, emailController.text!);
           // await pref.setString(AppKeys.passwordFromForm, passwordController.text!);
           await pref.setInt(AppKeys.userId, userModel.id!??3);

            AccessTokenController controller = Get.find();


           // controller.setPassword(userModel.password!);
           controller.setEmail(userModel.email!);
           controller.setUserId(userModel.id!??3);

           isLoading.value = false;

           await sendOtp().then((v){
             Get.to(OtpVerificationScreenFromRegister(email: emailController.text,));
           });


         }

         else if(response.statusCode == 500){
           Get.snackbar(
             'Email Already Exists!',
             'Please register with new credentials',
             snackPosition: SnackPosition.BOTTOM,
             backgroundColor: black,
             colorText:plumGrey,
             duration: Duration(seconds: 5),
           );

         }
         else{
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
          print("Error at postData of RegisterPage1Controller: "+e.toString());
        }
  }

  _buildBodyLogin(){
    return {
      'email' : emailController.text,
      'password':passwordController.text
    };
  }

  _buildBody (){
    return {
      "name": firstNameController.text+ " "+lastNameController.text, "email": emailController.text, "password": passwordController.text
    };
  }

  Future sendOtp()async{

    final uri = Uri.parse(AppUrls.baseUrl+AppUrls.getOtp);

    try{
      isLoading.value = true;
      final response = await http.post(
        uri,
        body: _buildBody(),
      );
      var data = await jsonDecode(response.body);

      if(response.statusCode==201) {
        Get.to(OtpVerificationScreen(email: emailController.text));

      }

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

  _buildBodyEmailOnly (){
    return {
      'email':emailController.text,
    };
  }

}