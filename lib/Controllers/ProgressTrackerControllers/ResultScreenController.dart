import 'package:get/get.dart';

class ResultScreenController extends GetxController{

  var tabs = [true,false].obs;

  void updateTabs (int index){
    if(index == 0){
      tabs[0] = true;
      tabs[1] = false;
    }
    if(index == 1){
      tabs[1] = true;
      tabs[0] = false;
    }

  }
}