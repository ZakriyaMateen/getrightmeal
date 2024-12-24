import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/progressTracker/Results/ResultScreenPhotoTab.dart';
import 'package:getrightmeal/views/progressTracker/Results/ResultScreenStatisticTab.dart';

import '../../../Controllers/ProgressTrackerControllers/ResultScreenController.dart';
import '../../../constants/Sizes.dart';
import '../../../constants/fontWeights.dart';
import '../../../widgets/Text.dart';

class ResultScreenHolder extends StatefulWidget {
  const ResultScreenHolder({super.key});

  @override
  State<ResultScreenHolder> createState() => _ResultScreenHolderState();
}

class _ResultScreenHolderState extends State<ResultScreenHolder> {
  ResultScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05, top: Get.height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              resultScreenHolderAppBar(),
              SizedBox(height: 20,),

              Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(99)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 Obx(()=>   InkWell(
                   onTap:(){controller.updateTabs(0);},
                   child: Container(
                     width: w*0.44,
                     padding: EdgeInsets.symmetric(vertical: 8),
                     decoration: BoxDecoration(
                         gradient: controller.tabs[0]?
                         blueGradient:null,
                         borderRadius: BorderRadius.circular(99)
                     ),
                     child: Center(
                       child: MyText(
                         title: 'Photo',
                         size: size15,
                         fontWeight: controller.tabs[0]? w500:w400,
                         color: controller.tabs[0]? white:dustyRose,
                       ),
                     ),
                   ),
                 ),),
                    Obx(()=>InkWell(
                      onTap:(){controller.updateTabs(1);},
                      child: Container(
                        width: w*0.35,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                            gradient: controller.tabs[1]?
                            blueGradient:null,
                            borderRadius: BorderRadius.circular(99)
                        ),
                        child: Center(
                          child: MyText(
                            title: 'Statistic',
                            size: size15,
                            fontWeight: controller.tabs[1]? w500:w400,
                            color: controller.tabs[1]? white:dustyRose,
                          ),
                        ),
                      ),
                    ))

                  ],
                ),
              ),

              SizedBox(height: 15,),
              Obx(()=>
              controller.tabs[0]?
                  ResultScreenPhotoTab():
                  ResultScreenStatisticTab()
              )


            ],
          ),
        ),
      ),
    );
  }
  Widget resultScreenHolderAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black, size: 15),
            ),
          ),
        ),
        MyText(title: 'Progress Photo', color: black, fontWeight: w700, size: size15),
        InkWell(
          onTap: () {
            // Handle more actions
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.more_horiz, color: black, size: 15),
            ),
          ),
        ),
      ],
    );
  }

}
