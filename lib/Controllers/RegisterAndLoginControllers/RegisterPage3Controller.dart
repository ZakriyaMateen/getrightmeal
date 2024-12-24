import 'dart:convert';

import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/RegisterAndLoginControllers/RegisterPage2Controller.dart';
import 'package:getrightmeal/views/signupAndLogin/LoginPage.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage4.dart';
import 'package:getrightmeal/views/signupAndLogin/SuccessRegistrationScreen.dart';
import 'package:http/http.dart' as http;

import '../../constants/AppUrls.dart';
import '../AccessTokenController.dart';


class RegisterPage3Controller extends GetxController {
  var isLoading = false.obs;
  AccessTokenController accessTokenController = Get.put(AccessTokenController());

  RxInt selectedIndex = 0.obs;


  Future postData (int index)async{

    Get.to(RegisterPage4());



    // final uri = Uri.parse(AppUrls.baseUrl+AppUrls.patchUserProfile+accessTokenController.userId.toString());
    // try{
    //   print('line1');
    //   final response = await http.patch(
    //       uri,
    //       body:_buildBody()
    //   );
    //   print('line2');
    //
    //   print(jsonDecode(response.body));
    // }
    // catch(e){
    //   isLoading.value = false;
    //
    //   print("postData RegisterPage2Controller Error: "+e.toString());
    // }
  }


}
