import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/constants/fontWeights.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../Controllers/onBoardingModels/Screen1Controller.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  Screen1Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Obx(()=>Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            gradient: controller.isGetStartedTapped.value? blueGradient:noGradient
        ),
        child: Padding(padding:
        const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.isGetStartedTapped.value?"logoWithWhiteX.png":
                    'assets/logo.png',width: 150,height: 50,fit: BoxFit.contain,),
                  SizedBox(height: 8,),
                  MyText(title: 'Everybody Can Train',size: 16,color: plumGrey,fontWeight: w400,),
                ],
              ),
              InkWell(
                onTap: (){

                  controller.isGetStartedTapped.value = true;
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: controller.isGetStartedTapped.value? noGradient:
                      blueGradient,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Center(
                    child: MyText(
                      title:  'Get Started',
                      size: 14,
                      fontWeight: w600,
                      color: controller.isGetStartedTapped.value?darkBlue:white,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      )),
    );
  }
}
