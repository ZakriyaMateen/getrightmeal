import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/dashboard/HomeScreen.dart';
import '../../views/progressTracker/ProgressPhotoScreen.dart';



class CustomNavBarController extends GetxController{

  RxInt index = 0.obs;
  RxList<Widget> screens = [
    HomeScreen(),
    Container(),
    Container(),
    ProgressPhotoScreen(),
    Container(),
  ].obs;

  Widget screen(){
    return screens[index.value];
  }
  void updateIndex(int index){
    this.index.value = index;
  }

}