import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage3.dart';
import 'package:getrightmeal/widgets/ChooseGenderTextField.dart';
import 'package:getrightmeal/widgets/CustomTextField.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../Controllers/RegisterAndLoginControllers/RegisterPage2Controller.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2({super.key});

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {

  RegisterPage2Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height*0.07,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.25 ),
              child: Image.asset("registerPage2GirlImage.png",),
            ),
              SizedBox(height: 6,),
            MyText(title: "Let’s complete your profile",fontWeight: w700,color: black,size: size18,),
            MyTextOverflow(title: "It will help us to know more about you!",fontWeight: w400,color: plumGrey  ,size: size10,),

            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal:  Get.width * 0.05),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      iconPath: 'phoneIcon.png',
                      labelText: 'Phone',
                      controller: controller.phoneController,
                      // controller: controller.passwordController,
                      isPassword: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        else if(value.length<11){
                          return "phone must be 11 digits";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    ChooseGenderTextField(
                      controller: controller.genderController,
                      labelText: 'Choose Gender',
                      iconPath: "genderIcon.png",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                      iconPath: 'dateIcon.png',
                      labelText: 'Date of Birth',
                      controller: controller.dobController,
                      // controller: controller.passwordController,
                      isPassword: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            iconPath: 'weightIcon.png',
                            labelText: 'Your Weight',
                            controller: controller.weightController,
                            // controller: controller.passwordController,
                            isPassword: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            gradient: purpleGradient,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: MyText(title: 'KG',fontWeight: w500,color: white,size: size10,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomTextFormField(
                            iconPath: 'heightIcon.png',
                            labelText: 'Your Height',
                            controller:controller. heightController,
                            // controller: controller.passwordController,
                            isPassword: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field cannot be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              gradient: purpleGradient,
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: MyText(title: 'CM',fontWeight: w500,color: white,size: size10,),
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: Get.height*0.03,),

                    InkWell(
                      onTap: ()async{
                      if(controller.formKey.currentState!.validate()){
                               await controller.postData();
                      }
                      },
                      child: Container(

                        width: Get.width,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: blueGradient,
                          borderRadius: BorderRadius.circular(90)
                        ),
                        child: controller.isLoading.value?Center(child:CupertinoActivityIndicator()): Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(title: 'Next  ',size: 15,fontWeight: w700,color: white,),
                            Icon(Icons.arrow_forward_ios,color: white,size: size17,)
                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
