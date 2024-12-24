import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/Colors.dart';
import '../../../constants/Gradients.dart';
import '../../../constants/Sizes.dart';
import '../../../constants/fontWeights.dart';
import '../../../widgets/Text.dart';

class ResultScreenStatisticTab extends StatefulWidget {
  const ResultScreenStatisticTab({super.key});

  @override
  State<ResultScreenStatisticTab> createState() => _ResultScreenStatisticTabState();
}

class _ResultScreenStatisticTabState extends State<ResultScreenStatisticTab> {


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: "May",
              color: plumGrey,
              fontWeight: w600,
              size: size14,
            ),
            MyText(
              title: "June",
              color: plumGrey,
              fontWeight: w600,
              size: size14,
            ),
          ],
        ),
        SizedBox(height: 5,),
        statisticProgress(0.33, 0.67, 'Lose Weight',w),
        statisticProgress(0.88, 0.12, 'Height Increase',w),
        statisticProgress(0.57, 0.43, 'Muscle Mass Increase',w),
        statisticProgress(0.89, 0.11, 'Abs',w),

        SizedBox(height: Get.height*0.08,),
        Container(
          width: w,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: blueGradient
          ),
          child: Center(
            child: MyText(
              title: 'Back to Home',
              fontWeight: w700,
              size: size15,
              color: white,
            ),
          ),
        )
      ],
    );
  }
  Widget statisticProgress(double v1, double v2, String title,double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          SizedBox(height: 10,)  ,

        MyText(
          title: title,
          color: black,
          fontWeight: w400,
          size: size13,
        ),
        SizedBox(height: 8,),


        Row(
    crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
            title: "$v1%",
            textAlign: TextAlign.left,
            color: plumGrey,
            fontWeight: w500,
            size: size11,
            ),
            Container(
              height: 14,
              width: w*0.5,// Height of the progress bar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: lightBlue, // Inactive color
              ),
              child: Stack(
                children: [
                  Container(
                    width: w * v1*0.5, // Active width based on value
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: red.withOpacity(0.4)
                    ),
                  ),
                ],
              ),
            ),
            MyText(
              title: "$v2%",
              textAlign: TextAlign.left,
              color: plumGrey,
              fontWeight: w500,
              size: size11,
            )
          ],
        ),



      ],
    );
  }
}
