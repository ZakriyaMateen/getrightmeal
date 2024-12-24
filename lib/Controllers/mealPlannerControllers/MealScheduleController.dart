import 'dart:convert';

import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/Models/MealModel.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:http/http.dart' as http;

import '../../constants/Colors.dart';

class   MealScheduleController extends GetxController{
  // final List<DateTime> dates = List<DateTime>.generate(
  //     30, (index) => DateTime.now().add(Duration(days: index)));

  RxInt selectedIndex = 0.obs; // Track the selected index
  RxBool isLoading = false.obs;

  AccessTokenController accessTokenController = Get.find();

  RxList<MealModel> meals = <MealModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    accessTokenController.initializeAutomatically();
    fetch();
  }


  void selectDate(int index) {
    selectedIndex.value = index; // Update the selected index
  }


  Future fetch() async {
    try {
      isLoading.value = true;

      // Get the current date
      DateTime now = DateTime.now();

      // Get the current year
      int year = now.year;

      // Calculate the first day of the year
      DateTime firstDayOfYear = DateTime(year);

      // Calculate the week number (1-based)
      int weekNumber = ((now.difference(firstDayOfYear).inDays + firstDayOfYear.weekday - 1) / 7).ceil();

      final uri = Uri.parse('${AppUrls.baseUrl}${AppUrls.getMealPlan}/$weekNumber/$year');

      await accessTokenController.initializeAutomatically();

     
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${accessTokenController.accessToken}'
        },
      );
      isLoading.value = false;

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        meals.value = (data['meals'] as List).map((e) {
          return MealModel.fromJson(e);
        }).toList();

        print(meals[0].meals.breakfast);
      } else {
        isLoading.value = false;
        Get.snackbar(
          'No Meal Found!',
          'Please refresh or try again later',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: black,
          colorText: plumGrey,
          duration: Duration(seconds: 5),
        );
      }

    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
