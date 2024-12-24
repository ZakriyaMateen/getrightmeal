import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/dashboard/NotificationScreen.dart';
import 'package:getrightmeal/views/dashboard/charts/HeartRateChart.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import 'charts/BMIChart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String,dynamic>> latestWorkoutList = [
    {
      'image':'upperBodyWorkout.png',
      'title':'Full body Workout',
      'subtitle': '180 Calories Burn',
      'duration':'20 minutes',
      'progress':30.0
    },  {
      'image':'lowerBodyWorkout.png',
      'title':'Lowerbody Workout',
      'subtitle': '90 Calories Burn',
      'duration':'40 minutes',
      'progress':60.0
    },  {
      'image':'upperBodyWorkout.png',
      'title':'Abs Workout',
      'subtitle': '100 Calories Burn',
      'duration':'10 minutes',
      'progress':20.0
    },  {
      'image':'lowerBodyWorkout.png',
      'title':'Full body Workout',
      'subtitle': '180 Calories Burn',
      'duration':'20 minutes',
      'progress':80.0
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
          child: Column(
            children: [
              SizedBox(height: Get.height*0.045,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyText(
                        title: 'Welcome Back,',
                        fontWeight: w400,
                        color: dustyRose,
                        size: size11,
                      ), MyText(
                        title: 'Stefani Wong',
                        fontWeight: w700,
                        color: black,
                        size: size18,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(NotificationScreen());
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: textFieldColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Icon(Icons.notifications_none_outlined,color: black,size: 18,),
                        // child: Image.asset('notificationIcon.png',width: 20,height: 20,),
                      ),
                    ),
                  )
                ],
              ),
            SizedBox(height: 20,),
              Container(
                width: Get.width,
                height: 120,
                decoration: BoxDecoration(
                  gradient: blueGradient,
                  borderRadius: BorderRadius.circular(22)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          title: 'BMI (Body Mass Index',
                          color: white,
                          fontWeight: w600,
                          size: size13,
                        ),
                        MyText(
                          title: 'You have a normal weight',
                          color: white,
                          fontWeight: w400,
                          size: size11,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            gradient: purpleGradient
                          ),
                          child: Center(
                            child: MyText(
                              title: 'View More',
                              color: white,
                              fontWeight: w600,
                              size: size9 ,
                            ),
                          ),
                        )

                      ],
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),




              SizedBox(height: 15,),

              Container(
                width: Get.width,
                height: 50,
                decoration: BoxDecoration(
                      color: lightBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12),
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: 'Today Target',
                      color: black,
                      fontWeight: w500,
                      size: size13,
                    ),
                    Container(
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                        gradient: blueGradient,
                        borderRadius: BorderRadius.circular(80)
                      ),
                      child: Center(
                        child: MyText(
                          title: 'Check',
                          fontWeight: w400,
                          size: size11,
                          color: white,
                        ),
                      ),
                    )
                  ],
                ),
              ),




              SizedBox(height: 20,),

              Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    title: 'Activity Status',
                    color: black,
                    fontWeight: FontWeight.w600,
                    size: 15,
                  )
                ],
              ),
              SizedBox(height: 14,),

              Container(
                width: Get.width,
                height: 120,
                decoration: BoxDecoration(
                  color: lightBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Stack(
                  children: [
                    Align(alignment: Alignment.topLeft,

                    child: Padding(
                      padding:  EdgeInsets.only(top: 12,left: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: 'Heart Rate',
                            fontWeight: w500,
                            size: 11,
                            color: black,
                          ), MyText(
                            title: '78 BPM',
                            fontWeight: w600,
                            size: 13,
                            color: darkBlue,
                          ),

                        ],

                      ),
                    )
                      ,),

                    Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Heartratechart(),
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
                    title: 'Activity Status',
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


              ListView.builder(itemBuilder: (context,index){

                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(  0.5), // Slightly transparent grey shadow
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow direction: bottom
                      ),
                    ],

                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.min,
                       children: [

                         SizedBox(width: 3,),
                         ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                         child: Image.asset(latestWorkoutList[index]['image'],width: 40,height: 40,),
                       ),
                         SizedBox(width: 5,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             MyText(
                               title: latestWorkoutList[index]['title'],
                               fontWeight: w500,
                               color: grey,
                               size: 11,
                             ),

                             Container(
                               width:Get.width*0.64,
                               child: MyTextOverflow(
                                 textAlign: TextAlign.left,
                                 title:"${latestWorkoutList[index]['subtitle']} | ${latestWorkoutList[index]['subtitle']}",
                                 fontWeight: w400,
                                 color: plumGrey,
                                 size: 10,
                               ),
                             ),
                             SizedBox(height: 2,),

                              Container(
                                width: Get.width*0.6,
                                height:8,
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(20),
                                  color: darkBlue,
                                  value: (double.parse(latestWorkoutList[index]['progress'].toString())/100),
                                ),
                              )
                           ],
                         ),],),
                      Icon(Icons.arrow_forward_ios,color: plumGrey,size: 17,)
                    ],
                  ),
                );
              },itemCount: latestWorkoutList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)



            ],
          ),
        ),
      ),
    );
  }
}
