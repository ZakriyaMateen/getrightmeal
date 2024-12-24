import 'package:get/get.dart';
import 'package:getrightmeal/constants/AppKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessTokenController extends GetxController{
  RxString accessToken = "".obs;
  RxString password = "".obs;
  RxString email = "".obs;
  RxInt userId = 0.obs;
  void setAccessToken (String accessToken){
    this.accessToken.value = accessToken;
  }
  void setPassword(String password){
    this.password.value = password;
  }
  void setEmail (String email){
    this.email.value = email;
  }
  void setUserId(int userId){
    this.userId.value = userId;
  }

  Future initializeAutomatically()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email.value = (await prefs.getString(AppKeys.emailFromForm))!;
      password.value = (await prefs.getString(AppKeys.passwordFromForm))!;
      accessToken.value = (await prefs.getString(AppKeys.access_token)??"Showing Empty Access Token")!;
      userId.value = (await prefs.getInt(AppKeys.userId))!;
    }
    catch(e){
      print(e.toString());
    }
  }
}