import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';

import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';


class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                top: Get.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  addAlarmAppBar(),
                  SizedBox(height: 15,),

                  Container(
                    width: w,
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('bedtimeIcon.png',width: 17,height: 17,fit: BoxFit.contain,),
                            SizedBox(width: 4,),
                            Container(
                              width: w*0.5,
                              child: MyTextOverflow(
                                title: 'Bedtime',
                                color: plumGrey,
                                size: size11,
                                fontWeight: w500,
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              title: '09:00 PM',
                              color: plumGrey,
                              size: size9,
                              fontWeight: w500,
                            ),
                            SizedBox(width: 3,),
                            Icon(Icons.arrow_forward_ios,color: plumGrey,size: size15,)
                          ],
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: w,
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('clockIcon.png',width: 17,height: 17,fit: BoxFit.contain,),
                            SizedBox(width: 4,),
                            Container(
                              width: w*0.5,
                              child: MyTextOverflow(
                                title: 'Hours of Sleep',
                                color: plumGrey,
                                size: size11,
                                fontWeight: w500,
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: w*0.15,
                              child: MyTextOverflow(
                                title: '8Hrs 30mins',
                                color: plumGrey,
                                size: size9,
                                fontWeight: w500,
                              ),
                            ),
                            SizedBox(width: 3,),
                            Icon(Icons.arrow_forward_ios,color: plumGrey,size: size15,)
                          ],
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: w,
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('repeatIcon.png',width: 17,height: 17,fit: BoxFit.contain,),
                            SizedBox(width: 4,),
                            MyTextOverflow(
                              title: 'Repeat',
                              color: plumGrey,
                              size: size9,
                              fontWeight: w500,
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              title: 'Mon to Fri',
                              color: plumGrey,
                              size: size12,
                              fontWeight: w500,
                            ),
                            SizedBox(width: 3,),
                            Icon(Icons.arrow_forward_ios,color: plumGrey,size: size15,)
                          ],
                        )
                      ],
                    ),

                  ),
                  Container(
                    width: w,
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('vibrateIcon.png',width: 17,height: 17,fit: BoxFit.contain,),
                            SizedBox(width: 4,),
                            Container(
                              width: w*0.5,
                              child: MyTextOverflow(
                                title: 'Vibrate when Alarm Sounds',
                                color: plumGrey,
                                size: size11,
                                fontWeight: w500,
                              ),
                            )
                          ],
                        ),
                        Switch(value: false, onChanged: (v){},activeColor: lightPurple,activeTrackColor: darkPurple,inactiveThumbColor: white,)
                      ],
                    ),

                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Container(
                width: w,
                height: 45,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    gradient: blueGradient,
                    borderRadius: BorderRadius.circular(80)
                ),
                child: Center(child: MyText(
                  title: 'Add',
                  color: white,
                  fontWeight: w600,
                  size: size15,
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget addAlarmAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black, size: 15),
            ),
          ),
        ),
        MyText(title: 'Add Alarm', color: black, fontWeight: w700, size: size15),
        InkWell(
          onTap: () {
            // Handle more actions
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.more_horiz, color: black, size: 15),
            ),
          ),
        ),
      ],
    );
  }

}
