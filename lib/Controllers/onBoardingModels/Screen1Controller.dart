import 'package:get/get.dart';

import '../../views/onBoarding/OnBoarding.dart';

class Screen1Controller extends GetxController{


  RxBool isGetStartedTapped = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(isGetStartedTapped, (bool tapped) {
      if (tapped == true) {
        navigate();
      }
    });
  }


   navigate()async{
    Future.delayed(Duration(milliseconds: 1300),(){
      //Navigate
      Get.to(OnBoarding(),transition: Transition.upToDown);
    });
  }

}