import 'package:get/get.dart';

class SleepScheduleController extends GetxController {
  // List of dates starting from today (adjust as needed)
  var dates = List<DateTime>.generate(30, (index) => DateTime.now().add(Duration(days: index)));
  var selectedIndex = 0; // Observable selected index
  var isSelected = false.obs;
}
