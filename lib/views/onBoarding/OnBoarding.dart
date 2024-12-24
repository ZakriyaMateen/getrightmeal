import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/widgets/Text.dart';
import '../../Controllers/onBoardingModels/OnBoardingController.dart';
import '../../constants/Colors.dart';
import '../signupAndLogin/RegisterPage1.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
    
  OnBoardingController controller = Get.find();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Obx(()=>  Image.asset(
          controller. onBoardingImagesPaths[controller.index.value],
          fit: BoxFit.contain,
        ),),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 15,),
              Obx(()=>MyText(
                title: controller.titles[controller.index.value],
                size: 22,
                color: black,
              ),)
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:Obx(()=> MyTextOverflow(
              title: controller.subtitles[controller.index.value],
              size: 12,
              color: plumGrey,
            ),)
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          // Circular Progress Bar around FAB
            Obx(()=>          TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: (controller.index.value + 1) / 4),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return SizedBox(
                  width: 50,  // Reduced the width
                  height: 50, // Reduced the height
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 3,
                    backgroundColor: transparent, // Remaining part color
                    valueColor: AlwaysStoppedAnimation(lightBlue), // Progress color
                  ),
                );
              },
            ),
            ),
          // Floating Action Button with gradient background and arrow icon
          FloatingActionButton(
            onPressed: () {
                if (controller.index.value < 3) {
                  controller.changeIndex();
                } else {
                  Get.to(RegisterPage1());
                  // Optionally handle navigation or logic at the end of onboarding
                }
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              width: 40,  // Reduced the size of the FAB container
              height: 40, // Reduced the size of the FAB container
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: blueGradient,
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,  // Reduced the size of the arrow icon
              ),
            ),
          ),
        ],
      ),
      // Position FAB in the bottom-right corner
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
