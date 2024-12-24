import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/constants/Sizes.dart';
import 'package:getrightmeal/constants/fontWeights.dart';
import 'package:getrightmeal/widgets/CustomTextField.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../Controllers/RegisterAndLoginControllers/RegisterPage1Controller.dart';
import 'LoginPage.dart';
import 'RegisterPage2.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key});

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {

  RegisterPage1Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:
          SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.center,children: [  MyText(
                title: 'Hey there,',
                size: size14,
                fontWeight: w400,
                color: black,
              ),
                SizedBox(height: 8),
                MyText(
                  title: 'Create an Account',
                  size: size18,
                  fontWeight: w800,
                  color: black,
                ),
                SizedBox(height: 25),],),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      isPassword: false,
                      iconPath: 'firstNameIcon.png',
                      labelText: 'First Name',
                      controller: controller.firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                      isPassword: false,
                      iconPath: 'lastNameIcon.png',
                      labelText: 'Last Name',
                      controller: controller.lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field cannot be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                      isPassword:false,
                      iconPath: 'emailIcon.png',
                      labelText: 'Email',
                      controller: controller.emailController,
                      validator: (value) {
                        if (!EmailValidator.validate(value!)) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8,),
                    CustomTextFormField(
                      iconPath: 'passwordIcon.png',
                      labelText: 'Password',
                      controller: controller.passwordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty ) {
                          return 'This field cannot be empty';
                        }
                        else if(value.length < 8){
                          return 'Must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(()=> Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (v) {
                            controller.toggleIsChecked(v!);
                          },
                          fillColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return dustyRose; // Color when the checkbox is checked
                            }
                            return white; // Color when the checkbox is unchecked
                          }),
                          // Customize the border of the checkbox
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // Border radius
                          ),
                          // Customize the border side color and width
                          side: BorderSide(
                            color:controller.isChecked.value? dustyRose:plumGrey, // Border color
                            width: 1, // Border width
                          ),
                        )),
                        Container(
                          width: Get.width*0.6,
                          child: MyTextOverflow(
                            fontWeight: w100,
                            color: dustyRose,
                            size: size12,
                            title: "By continuing you accept our Privacy Policy and Term of Use",
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: Get.height*0.12,),
              InkWell(
                onTap: controller.isLoading.value?(){print('loading');}:()async {
                  // Manually validate the form and show errors
                  if (controller.formKey.currentState!.validate()) {
                    if(controller.isChecked.value){
                      controller.postData();
                    }
                    else{ Get.snackbar(
                      'Rejected!',
                      'Please accept out privacy policy and terms & conditions',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: black,
                      colorText:plumGrey,
                      duration: Duration(seconds: 5),
                    );}


                    // Get.to(RegisterPage2());
                  } else {

                  }
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                      gradient: blueGradient,
                      borderRadius: BorderRadius.circular(90)
                  ),
                  child: Center(child:
                  Obx(() => controller.isLoading.value
                    ?// Show CircularProgressIndicator on Android
                       CupertinoActivityIndicator() // Show CupertinoActivityIndicator on iOS
                      : MyText(
                    title: 'Register',
                    size: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  )
                 ),
                ),
              ),


              orRow(),
              googleFacebookRow(),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(title:"Already have an account? ",color: black,fontWeight: w400,size: 12,),
                  InkWell(
                      onTap: (){
                        Get.to(LoginPage());
                      },
                      child: MyText(title: "Login",color: lightPurple,fontWeight: w400,size: 12,)),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
  Widget orRow(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10,),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Divider(
                color: grey,
                thickness: 1,
              ),
            ),
            SizedBox(width:4,),
            MyText(
              title: 'Or',
              color: black,
              size: 10,
              fontWeight: w400,
            ),
            SizedBox(width:4,),
            Flexible(
              child: Divider(
                color: grey,
                thickness: 1,
              ),
            ),
          ],
        ),

        SizedBox(height: 10,),


      ],
    );
  }

  Widget googleFacebookRow(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        googleFacebookContainer('googleIcon.png'),
        SizedBox(width: 10,),
        googleFacebookContainer('facebookIcon.png'),
      ],
    );
  }
  Widget googleFacebookContainer(String imagePath){
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color:grey,width: 1)
      ),
      alignment: Alignment.center,
      child: Center(
        child:Padding(
          padding:  EdgeInsets.all(12.0),
          child: Image.asset('$imagePath'),
        ) ,
      ),
    );
  }

}
