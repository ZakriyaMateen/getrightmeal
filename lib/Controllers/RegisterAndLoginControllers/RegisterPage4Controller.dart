import 'package:get/get.dart';

class RegisterPage4Controller extends GetxController {
  var preferences = [
    {'title': 'Balanced Diet', 'isSelected': false},
    {'title': 'Dairy Free', 'isSelected': false},
    {'title': 'Diabetic Diet', 'isSelected': false},
    {'title': 'High Protein', 'isSelected': false},
    {'title': 'Low Carb', 'isSelected': false},
    {'title': 'Pescatarian', 'isSelected': false},
    {'title': 'Vegan', 'isSelected': false},
    {'title': 'Vegetarian', 'isSelected': false},
    {'title': 'Wheat Free', 'isSelected': false},
  ].obs;

  void selectIndex(int index) {
    preferences[index]['isSelected'] = !(preferences[index]['isSelected'] as bool);
    preferences.refresh();
  }
  List<int> getSelectedIndices() {
    List<int> selectedIndices = [];
    for (int i = 0; i < preferences.length; i++) {
      if (preferences[i]['isSelected'] as bool) {
        selectedIndices.add(i);
      }
    }
    return selectedIndices;
  }

}
