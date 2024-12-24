
import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/views/dashboard/HomeScreen.dart';

import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class FinishedWorkoutScreen extends StatelessWidget {
  const FinishedWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top:Get.height*0.06,bottom: Get.height*0.02 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset('finishedWorkoutImage.png'),
                ),
                SizedBox(height: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,children: [
                  MyTextOverflow(
                    textAlign: TextAlign.center,
                    title: 'Congratulations, You Have Finished Your Workout',
                    size: size18,
                    fontWeight: w800,
                    color: black,
                  ),
                  SizedBox(height: 7),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MyTextOverflow(
                      textAlign: TextAlign.center,
                      title: 'Exercises is king and nutrition is queen. Combine the two and you will have a kingdom',
                      size: size12,
                      fontWeight: w400,
                      color: black,
                    ),
                  ),

                  SizedBox(height: 2),
                  MyTextOverflow(
                    textAlign: TextAlign.center,
                    title: '-Jack Lalanne',
                    size: size12,
                    fontWeight: w400,
                    color: black,
                  ),

                ],),

              ],
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
              child: InkWell(
                onTap: () {
                  Get.to(HomeScreen());
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: blueGradient,
                      borderRadius: BorderRadius.circular(90)
                  ),
                  child: const Center(child: MyText(title: 'Back to Home',size: 15,fontWeight: w700,color: white,)),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
