
import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/views/dashboard/HomeScreen.dart';
import 'package:getrightmeal/views/signupAndLogin/LoginPage.dart';

import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class SuccessRegistrationScreen extends StatelessWidget {
  const SuccessRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.only(top:Get.height*0.1,bottom: Get.height*0.02 ),
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
                  child: Image.asset('successRegistration.png'),
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,children: [
                  MyText(
                    title: 'Welcome, Stefani',
                    size: size18,
                    fontWeight: w800,
                    color: black,
                  ),
                  SizedBox(height: 8),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyTextOverflow(
                        textAlign: TextAlign.center,
                                        title: 'You are all set now, let’s reach your goals together with us',
                                        size: size14,
                                        fontWeight: w400,
                                        color: black,
                                      ),
                    ),

                  SizedBox(height: 25),],),

              ],
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
              child: InkWell(
                onTap: () {
                 Get.to(LoginPage());
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: blueGradient,
                      borderRadius: BorderRadius.circular(90)
                  ),
                  child: const Center(child: MyText(title: 'Go to Home',size: 15,fontWeight: w700,color: white,)),
                ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}
