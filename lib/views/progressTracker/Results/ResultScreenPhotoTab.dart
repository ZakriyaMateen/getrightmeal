import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/constants/fontWeights.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../../constants/Sizes.dart';


class ResultScreenPhotoTab extends StatefulWidget {
  const ResultScreenPhotoTab({super.key});

  @override
  State<ResultScreenPhotoTab> createState() => _ResultScreenPhotoTabState();
}

class _ResultScreenPhotoTabState extends State<ResultScreenPhotoTab> {
   double value = 0.6; // Should be between 0.0 and 1.0



  @override
  Widget build(BuildContext context) {
    var percentage = (value * 100).toStringAsFixed(0);

    double w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: 'Average Progress',
                color: black,
                fontWeight: w600,
                size: size15,
              ),MyText(
                title: 'Good',
                color: green,
                fontWeight: w500,
                size: size11,
              ),
            ],
          ),
          SizedBox(height: 14,),
          Container(
            height: 20, // Height of the progress bar
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: textFieldColor, // Inactive color
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * value, // Active width based on value
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: purpleGradient
                  ),
                ),
                Center(
                  child: MyText(
                    title: "$percentage%",
                    textAlign: TextAlign.left,
                    color: white,
                    fontWeight: w500,
                    size: size11,
                  )
                  ),
              ],
            ),
          ),

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
              )

            ],
          ),
          SizedBox(height: 5,),
          dualPics('Front Facing', "girlImage2.png", "image2Path", w),
          dualPics('Back Facing', "girlImage2.png", "image2Path", w),
          dualPics('Left Facing', "girlImage2.png", "image2Path", w),
          dualPics('Right Facing', "girlImage2.png", "image2Path", w),
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
          ),
          SizedBox(height: 20,),
        ],
      ),

    );
  }


  Widget dualPics(String title,String image1Path, String image2Path,double w){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        MyText(
          title: title,
          fontWeight: w500,
          size: size13,
          color: plumGrey,
        ),
        SizedBox(height: 10,),
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: w*0.42,
              height: w*0.42,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image1Path),
              ),
            ),Container(
              width: w*0.42,
              height: w*0.42,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(image1Path),
              ),
            ),
          ],
        )
      ],
    );
  }
}
