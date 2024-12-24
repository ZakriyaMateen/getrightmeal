import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/progressTracker/ComparisonScreen.dart';
import 'package:getrightmeal/views/progressTracker/TakePhoto.dart';

import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class ProgressPhotoScreen extends StatefulWidget {
  const ProgressPhotoScreen({super.key});

  @override
  State<ProgressPhotoScreen> createState() => _ProgressPhotoScreenState();
}

class _ProgressPhotoScreenState extends State<ProgressPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
          Get.to(TakePhoto());

        }, child: Container(width: 50,height: 50,decoration: BoxDecoration(shape: BoxShape.circle,gradient: purpleGradient),
        padding: EdgeInsets.all(15),
        child: Image.asset('cameraIcon.png',width: 18,height: 18,),),backgroundColor: transparent,),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: Get.width*0.05,right: Get.width*0.05,top: Get.height*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    progressPhotoScreenAppBar(),
                SizedBox(height: 20,),
                Container(
                  width :w,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  decoration: BoxDecoration(
                    gradient: blueGradientLight,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:w*0.5,
                              child: MyTextOverflow(
                                textAlign: TextAlign.left,
                                title: 'Track Your Progress Each Month With Photo',
                                size: size11,
                                fontWeight: w500,
                              ),
                            ),
                            SizedBox(height: 7,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                              decoration: BoxDecoration(
                                gradient: blueGradient,
                                borderRadius: BorderRadius.circular(80)
                              ),
                              child: MyText(title: 'Learn More',
                                color: white,
                                size: 10,
                                fontWeight: w600,
                              ),
                            )
                          ],
                      ),
                      Image.asset('progressImageCalendar.png',width: 70,height: 70,)
                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Container(
                  width: w,
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                  decoration: BoxDecoration(
                      gradient: blueGradientLight,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     MyText(
                       title: 'Compare my Photo',
                       color: black,
                       size: 13,
                       fontWeight: w500,
                     ),
                     InkWell(
                       onTap: (){
                         Get.to(ComparisonScreen());
                       },
                       child: Container(
                         padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                         decoration: BoxDecoration(
                             gradient: blueGradient,
                             borderRadius: BorderRadius.circular(80)
                         ),
                         child:  MyText(
                           title: 'Compare',
                           color: white,
                           size: 11,
                           fontWeight: w400,
                         ),
                       ),
                     )
                   ],
                  ),
                ),

                SizedBox(height: 20,),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: 'Gallery',
                      color: black,
                      fontWeight: FontWeight.w600,
                      size: 15,
                    ),
                    MyText(
                      title: 'See more',
                      color: dustyRose,
                      fontWeight: FontWeight.w500,
                      size: size11,
                    )
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                
                Container(
                  width: w,
                  height: 80,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(right: 7),
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('galleryImage.png',fit: BoxFit.cover,),
                      ),
                    );
                  },itemCount: 20,scrollDirection: Axis.horizontal,),
                ),
                SizedBox(height: 20,),
                Container(
                  width: w,
                  height: 80,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Container(
                      margin: EdgeInsets.only(right: 7),
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('galleryImage.png',fit: BoxFit.cover,),
                      ),
                    );
                  },itemCount: 20,scrollDirection: Axis.horizontal,),
                )
                



              ],
          ),
        ),
      ),
    );
  }
  Widget progressPhotoScreenAppBar(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new_rounded,color: black,size: 15,),
            ),
          ),
        ),


        MyText(title: 'Progress Photo', color: black, fontWeight: w700,size: size15,),
        InkWell(
          onTap: (){
            // Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: textFieldColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(Icons.more_horiz,color: black,size: 15,),
            ),
          ),
        ),


      ],
    );

  }

}
