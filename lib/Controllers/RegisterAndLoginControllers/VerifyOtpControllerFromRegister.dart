import 'dart:convert';

import 'package:get/get.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/UserProfileModel.dart';
import '../../constants/AppKeys.dart';
import '../../constants/Colors.dart';
import '../AccessTokenController.dart';

class VerifyOtpScreenControllerFromRegister extends GetxController{

  var otp = ''.obs;
  var email = ''.obs;
  RxBool isLoading = false.obs;
  Rx<UserProfileModel?> userProfileModel = Rx<UserProfileModel?>(null);

  Future postData()async{
    try{
      var uri = Uri.parse(AppUrls.baseUrl+AppUrls.login);

      final response = await http.post(
          uri,
          body:  _buildBody()
      );
      if(response.statusCode == 201){
        print(" response Body : " +response.body);
        AccessTokenController controller = Get.find();

        await fetchUserWithEmail();


        var data = await jsonDecode(response.body);

        SharedPreferences pref = await SharedPreferences.getInstance();


        await pref.setString(AppKeys.access_token, data[AppKeys.access_token]);
        await pref.setString(AppKeys.emailFromForm, email.value);
        await pref.setString(AppKeys.passwordFromForm, otp.value);
        await pref.setInt(AppKeys.userId, userProfileModel.value?.id! ?? 3);


        controller.setAccessToken(data[AppKeys.access_token]);
        controller.setEmail(email.value);

        print(data[AppKeys.access_token]);

        isLoading.value = false;
        Get.to(RegisterPage2());
      }else{
        Get.snackbar(
          'Invalid Otp!',
          'Please try again with correct Otp',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: black,
          colorText:plumGrey,
          duration: Duration(seconds: 5),
        );

      }
    }
    catch(e){
      print(e.toString());
    }
  }


  Future fetchUserWithEmail()async{
    try{
      final uri = Uri.parse(AppUrls.baseUrl+AppUrls.getUserWithEmail+email.value);
      final response = await http.get(uri);

      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        print(data);
        userProfileModel.value   = UserProfileModel.fromJson(data);
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  _buildBody(){
    return {
      'email':email.value,
      'otp':otp.value
    };
  }

  validation(){
    return otp.value.length>=6;
  }

}