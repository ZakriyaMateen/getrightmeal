import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/constants/AppUrls.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import '../../Controllers/profileScreenController/ProfileScreenController.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  ProfileScreenController controller = Get.put(ProfileScreenController());




  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Obx(()=>controller.isLoading.value? Center(child:CupertinoActivityIndicator()):

      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: Get.width*0.05,right: Get.width*0.05,top: Get.height*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileScreenAppBar(),
              SizedBox(height: 20,),
              profileRow(),
              SizedBox(height: 10,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  profileInfoCard('${controller.userProfileModel.value!.profile.height.toString()}cm', 'Height',w),
                  profileInfoCard('${controller.userProfileModel.value!.profile.weight.toString()}kg', 'Weight',w),
                  profileInfoCard('${controller.userProfileModel.value!.profile.dateOfBirth?.toString()}yo', 'Age',w),
                ],
              ),
              SizedBox(height: 10,),
              accountCard(w),
              SizedBox(height: 10,),
              notificationCard(w),
              SizedBox(height: 10,),
              otherCard(w),

            ],
          ),
        ),
      )),
    );
  }

  Widget notificationCard(double w){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: white,
      elevation: 5.0,
      child: Container(
        width: w,
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              title: 'Account',
              size: size15,
              color: black,
              fontWeight: w600,
            ),
            SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 children: [
                   Image.asset('notification.png',width: 18,height: 18,),
                    SizedBox(width: 5,),
                    MyText(
                      title: 'Pop-up Notification',
                      color: plumGrey,
                      fontWeight: w400,
                      size: 11,
                    ),
                 ],
               ),

                Switch(
                  activeTrackColor: lightPurple,
                  inactiveTrackColor: white,
                  inactiveThumbColor: darkPurple,
                  value: false,
                  onChanged: (v) {
                    // Handle switch change
                  },
                  activeColor: lightPurple, // This is fine for activeColor

                )

              ],
            )
          ],
        ),
      ),
    );
  }
  Widget otherCard(double w){
    return
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: white,
        elevation: 5.0,
        child: Container(
          width: w,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: 'Other',
                size: size15,
                color: black,
                fontWeight: w600,
              ),
              SizedBox(height: 12,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('profileScreenEmailIcon.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Contact Us',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),
              SizedBox(height: 4,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('privacyIcon.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Privacy Policy',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),
              SizedBox(height: 4,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('settingsIcons.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Settings',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),


            ],
          ),

        ),
      )
    ;
  }

  Widget accountCard(double w){
    return
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: white,
        elevation: 5.0,
        child: Container(
          width: w,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: 'Account',
                size: size15,
                color: black,
                fontWeight: w600,
              ),
              SizedBox(height: 12,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('profileScreenAccountIcon1.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Personal Data',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),
              SizedBox(height: 4,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('profileScreenAccountIcon2.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Achievement',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),
              SizedBox(height: 4,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('profileScreenAccountIcon3.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Activity History',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              ),
              SizedBox(height: 4,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('profileScreenAccountIcon4.png',width: 18,height: 18,),
                      SizedBox(width: 5,),
                      MyText(
                        title: 'Workout Progress',
                        color: plumGrey,
                        fontWeight: w400,
                        size: 11,
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: plumGrey,size: 15,)
                ],
              )

            ],
          ),

        ),
      )
        ;
  }

  Widget profileInfoCard(String title, String subtitle,double w){
    return
      Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: white,
        elevation: 5.0,
        child: Container(
          width: w*0.24,
          height: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                title: title,
                color: lightBlue,
                size: 13,
                fontWeight: w500,
              ),
              SizedBox(height: 3,),
              MyText(
                title: subtitle,
                color: plumGrey,
                size: 11,
                fontWeight: w400,
              ),
            ],
          ),
        ),
      )
        ;
  }

  Widget profileRow(){
    return
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('profileImage.png'),
              ),
              SizedBox(width: 7,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: controller.userProfileModel.value!.name,
                    fontWeight: w500,
                    size: size13,
                    color: Colors.black,
                  ),
                  MyText(
                    title: controller.userProfileModel.value!.profile.goal.toString(),
                    fontWeight: w400,
                    size: size11,
                    color: plumGrey,
                  ),
                ],
              ),

            ],
          ),
          InkWell(
            onTap: (){
              Get.to(RegisterPage2());
            },
            child: Container(
              width: 70,
              height: 25,
              decoration: BoxDecoration(
                  gradient: blueGradient,
                  borderRadius: BorderRadius.circular(80)
              ),
              child: Center(
                child: MyText(
                  title: 'Edit',
                  color: white,
                  fontWeight: w500,
                  size: 11,
                ),
              ),
            ),
          ),
        ],
      );
  }

  Widget ProfileScreenAppBar(){
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


        MyText(title: 'Profile', color: black, fontWeight: w700,size: size15,),
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
