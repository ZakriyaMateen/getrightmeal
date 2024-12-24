import 'package:get/get.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';

import '../AccessTokenController.dart';


class SplashScreenController extends GetxController{
  AccessTokenController accessTokenController = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accessTokenController.initializeAutomatically().then((v){
      print("Uid "+accessTokenController.userId.toString());
      print("Email "+accessTokenController.email.toString());
      print("Password "+accessTokenController.password.toString());
      print("Access Token "+accessTokenController.accessToken.toString());

      Get.to(CustomBottomNavBar());
    });


  }

}