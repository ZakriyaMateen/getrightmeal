import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/RegisterAndLoginControllers/RegisterPage5Controller.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';

import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class RegisterPage5 extends StatefulWidget {
  const RegisterPage5({super.key});

  @override
  State<RegisterPage5> createState() => _RegisterPage5State();
}

class _RegisterPage5State extends State<RegisterPage5> {

  RegisterPage5Controller controller = Get.put(RegisterPage5Controller());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w*0.05,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              SizedBox(height: 10),
              MyTextOverflow(
                title: 'Activity Level',
                textAlign: TextAlign.center,
                color: black,
                fontWeight: w600,
                size: size17,
              ),
              SizedBox(height: 10),

            Obx(()=>  ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){

                return GestureDetector(
                  onTap: (){
                    controller.selectIndex(index);
                    controller.selectedIndex = index;
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    width: w,
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border:  Border.all(color:(controller.activityList[index]['isSelected'] as bool)? darkBlue:lightBlue,
                          width: (controller.activityList[index]['isSelected'] as bool)? 2:1)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(title: controller.activityList[index]['title'].toString(),color: black,fontWeight: w500,size: size15,),
                        MyText(title: controller.activityList[index]['subtitle'].toString(),fontWeight: w400,color: plumGrey,size: size12)
                      ],
                    ),

                  ),
                );
            },itemCount: controller.activityList.length,)),

              SizedBox(height: 40,),
              Obx(() => GestureDetector(
                onTap: () {
                  controller.postData();
                  // controller.selectedIndex!=null?
                  //   print('null'):
                  //     Get.to(CustomBottomNavBar());
                  // You can handle the selected indices further here
                },
                child: Container(
                  width: w,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: controller.activityList.any((element) => element['isSelected'] as bool)
                        ? blueGradient
                        : blueGradientLight,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child:Obx(()=>
                        controller.isLoading.value? CupertinoActivityIndicator():
                        MyTextOverflow(
                      title: 'Continue',
                      size: size17,
                      color: white,
                      fontWeight: w600,
                    ),)
                  ),
                ),
              ))


            ],
          ),
        ),
      ),
    );
  }
}
