import 'dart:convert';

import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/RegisterAndLoginControllers/RegisterPage3Controller.dart';
import 'package:getrightmeal/Controllers/RegisterAndLoginControllers/RegisterPage4Controller.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';
import 'package:http/http.dart' as http;
import '../AccessTokenController.dart';
import 'RegisterPage2Controller.dart';

class RegisterPage5Controller extends GetxController {
  var activityList = [
    {'title': 'No Exercise','subtitle':'Sedentary Lifestyle', 'isSelected': false},
    {'title': 'Light Exercise','subtitle':'1-2 times/week', 'isSelected': false},
    {'title': 'Moderate Exercise','subtitle':'3-4 times/week', 'isSelected': false},
    {'title': 'Heavy Exercise','subtitle':'5-6 times/week', 'isSelected': false},
    {'title': 'Athlete', 'subtitle':'6-7 times/week','isSelected': false},

  ].obs;

  var isLoading = false.obs;

  int? selectedIndex ;
  AccessTokenController accessTokenController = Get.put(AccessTokenController());


  void selectIndex(int index) {
    for (int i = 0; i < activityList.length; i++) {
      activityList[i]['isSelected'] = false;
    }
    activityList[index]['isSelected'] =
    !(activityList[index]['isSelected'] as bool);
    activityList.refresh();
  }



  Future<void> postData() async {
    RegisterPage3Controller registerPage3Controller = Get.find();
    RegisterPage2Controller registerPage2Controller = Get.find();
    RegisterPage4Controller registerPage4Controller = Get.find();
    await accessTokenController.initializeAutomatically();
    isLoading.value = true;

    // Map your selectedIndex to allowed goal values
    int goalValue = registerPage3Controller.selectedIndex.value;
    goalValue=goalValue+1;
    // Ensure goal is valid


    final Map<String, dynamic> payload = {
      'country': 1, // Assuming you need to add this field
      'city': 'Dubai', // Add city if required
      'phone': registerPage2Controller.phoneController.text, // Send phone number
      'dateOfBirth': registerPage2Controller.dobController.text, // Ensure valid date format
      'gender': registerPage2Controller.genderController.text, // Send gender as string
      'height': int.parse(registerPage2Controller.heightController.text), // Send as int
      'weight': double.tryParse(registerPage2Controller.weightController.text) ?? 0.0, // Send as double
      'goal': goalValue, // Use the validated goal value
      'activityLevel': selectedIndex ?? 1, // Keep as int
      'dairyPreferences': registerPage4Controller.getSelectedIndices(), // Send List as-is
      'cuisinePreferences': [1], // Example List
    };

    try {
      print(accessTokenController.userId.value);
      print(accessTokenController.accessToken.value);
      final response = await http.patch(
        Uri.parse('${AppUrls.baseUrl}${AppUrls.patchUserProfile}'),
        headers: {
          // 'Authorization': "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4uZG9lQGV4YW1wbGUuY29tIiwic3ViIjozLCJpYXQiOjE3Mjk1OTM2MDEsImV4cCI6MTgxNTkwNzIwMX0.XSRvOFbwXTp1rqodU6hSmQxiQKF1QAW8XCFZUs764rQ",
          'Authorization': "Bearer ${accessTokenController.accessToken.value}",
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonEncode(payload), // Encode the payload to JSON
      );
      if(response.statusCode == 200){
        print('REsponse after updating');
        print(response.body);
          Get.to(CustomBottomNavBar());
      }
      isLoading.value = false;

    } catch (e) {
      print('Error occurred: ${e.toString()}');
    } finally {
      isLoading.value = false; // Reset loading state
    }
  }

}
