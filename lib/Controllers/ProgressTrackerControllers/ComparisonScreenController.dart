import 'package:get/get.dart';

class ComparisonScreenController extends GetxController {
  var selectedMonth1 = 'May'.obs; // Observable for Month 1
  var selectedMonth2 = 'May'.obs; // Observable for Month 2

  // Function to update Month 1
  void updateMonth1(String month) {
    selectedMonth1.value = month;
  }

  // Function to update Month 2
  void updateMonth2(String month) {
    selectedMonth2.value = month;
  }
}
