import 'dart:convert';

import 'package:get/get.dart';
import 'package:getrightmeal/Models/UserProfileModel.dart';
import 'package:http/http.dart' as http;

import '../../constants/AppUrls.dart';
import '../../constants/Colors.dart';
import '../AccessTokenController.dart';


class ProfileScreenController extends GetxController{
  Rx<UserProfileModel?> userProfileModel = Rx<UserProfileModel?>(null);
  var isLoading = false.obs;


  Future fetchProfile()async{
    AccessTokenController accessTokenController = Get.find();

    try{
      isLoading.value = true;
      await accessTokenController.initializeAutomatically();

        if(accessTokenController.accessToken.value!=''){

          final uri = Uri.parse(AppUrls.baseUrl+AppUrls.getUserProfile);

          final response = await http.get(
              uri,
              headers: {
                'Authorization': "Bearer ${accessTokenController.accessToken}"
              }
          );
          if(response.statusCode == 200){
            var data =  jsonDecode(response.body);
            print(data.toString());
            try{
              userProfileModel.value = UserProfileModel.fromJson(data);
              print('done setting');

            }
            catch(e){
              print(e.toString());
            }
          }
          isLoading.value = false;
        }
        else{
          isLoading.value = false;
          Get.snackbar(
            'Error Loading Profile!',
            'Please try again!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: black,
            colorText:plumGrey,
            duration: Duration(seconds: 5),
          );

        }
    }
    catch(e){
      isLoading.value = false;

      print(e.toString());
    }


  }
  @override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
  await fetchProfile();
  }

}