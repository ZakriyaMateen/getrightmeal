import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/dashboard/HomeScreen.dart';
import 'package:getrightmeal/views/dashboard/ProfileScreen.dart';
import 'package:getrightmeal/views/mealPlanner/MealSchedule.dart';
import 'package:getrightmeal/views/progressTracker/ProgressPhotoScreen.dart';

import '../../Controllers/BottomNavBarController/CustomNavBarController.dart';
import '../../constants/Colors.dart';
import '../../constants/Sizes.dart';


class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  var screens = [
  // HomeScreen(),
  MealSchedule(),
  // Container(),
  // ProgressPhotoScreen(),
  ProfileScreen(),
  ];
    CustomNavBarController controller = Get.put(CustomNavBarController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controller.updateIndex(2);
        //   },
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   child: Container(
        //     width: 60,
        //     height: 60,
        //     margin: EdgeInsets.only(top: 10),
        //     decoration: BoxDecoration(
        //       gradient: blueGradient, // Your custom gradient
        //       shape: BoxShape.circle,
        //     ),
        //     child: Center(
        //       child: Icon(Icons.search, color: white, size: size18),
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Position at bottom center
        bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: w,
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 45),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Color of shadow
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4), // Offset to create shadow only on bottom
                  ),
                ],
              color: white
            ),
            child: Obx(()=>Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    controller.updateIndex(0);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(controller.index.value == 0?Icons.home_filled:Icons.home_outlined,color: controller.index.value == 0? darkPurple:dustyRose,size: size25,),
                      SizedBox(height: 3,),
                      if(controller.index.value==0)   Container(width: 3,height: 3,decoration: BoxDecoration(color: darkPurple,shape: BoxShape.circle),)
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: (){
                //     controller.updateIndex(1);
                //   },
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(controller.index.value == 1?Icons.query_stats:Icons.query_stats_outlined,color: controller.index.value == 1? darkPurple:dustyRose,size: size20,),
                //       SizedBox(height: 3,),
                //       if(controller.index.value==1) Container(width: 3,height: 3,decoration: BoxDecoration(color: darkPurple,shape: BoxShape.circle),)
                //     ],
                //   ),
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(width: size20,),
                //     SizedBox(height: 3,),
                //     // if(index==2) Container(width: 3,height: 3,decoration: BoxDecoration(color: darkPurple,shape: BoxShape.circle),)
                //   ],
                // ),
                // InkWell(
                //   onTap: (){
                //     controller.updateIndex(3);
                //   },
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(controller.index.value == 3?Icons.linked_camera:Icons.linked_camera_outlined,color: controller.index.value == 3? darkPurple:dustyRose,size: size20,),
                //       SizedBox(height: 3,),
                //       if(controller.index.value==3) Container(width: 3,height: 3,decoration: BoxDecoration(color: darkPurple,shape: BoxShape.circle),)
                //     ],
                //   ),
                // ),
                InkWell(
                  onTap: (){
                    controller.updateIndex(1);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(controller.index.value == 1?Icons.person_rounded:Icons.person_outline_rounded,color: controller.index.value == 1? darkPurple:dustyRose,size: size25,),
                      SizedBox(height: 3,),
                      if(controller.index.value==1)Container(width: 3,height: 3,decoration: BoxDecoration(color: darkPurple,shape: BoxShape.circle),)
                    ],
                  ),
                )
              ],
            )),
          ),
        ],
      ),
      body: Flexible(child: Obx(()=>screens[controller.index.value]))
    );
  }
}
