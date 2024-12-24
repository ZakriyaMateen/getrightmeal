import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage1.dart';
import 'package:getrightmeal/widgets/CustomTextField.dart';
import 'package:get/get.dart';
import '../../Controllers/RegisterAndLoginControllers/LoginPageController.dart';
import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05,vertical: Get.height*0.04),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
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
                    title: 'Welcome Back',
                    size: size18,
                    fontWeight: w800,
                    color: black,
                  ),
                  SizedBox(height: 25),],),

                SizedBox(height: 20,),

                CustomTextFormField(isPassword: false,
                labelText: 'Email',iconPath: "emailIcon.png",
                 controller: controller.emailController,
                 validator: (v){
                return  EmailValidator.validate(v!)? null:"Invalid Email";
                 },
                ),
                SizedBox(height: 8,),

                //  CustomTextFormField(isPassword: true,
                // labelText: 'Password',
                //   controller: controller.passwordController,
                //   iconPath: 'passwordIcon.png',
                //    validator: (value) {
                //      if (value == null || value.isEmpty) {
                //        return 'This field cannot be empty';
                //      }
                //      return null;
                //    },
                // ),
                // SizedBox(height: 6,),

                const MyTextUnderline(
                  title: 'Forgot your password?',
                  size: 12,
                  color:dustyRose,
                  fontWeight: w500,
                ),



                SizedBox(height: Get.height*0.2,),
                InkWell(
                  onTap: () {
                    controller.validate();
                    // Manually validate the form and show errors
                    // if (controller.formKey.currentState!.validate()) {
                    //   Get.to(RegisterPage2());
                    // } else {
                    //
                    // }
                  },
                  child: Container(
                    width: Get.width,
                    height: 45,
                    decoration: BoxDecoration(
                        gradient: blueGradient,
                        borderRadius: BorderRadius.circular(90)
                    ),
                    child: Obx(()=> controller.isLoading.value ? Center(child: CupertinoActivityIndicator(),): Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login,color: white,size: 18,),
                        MyText(title: '  Login',size: 15,fontWeight: w700,color: white,),
                      ],
                    ),)
                  ),
                ),

                orRow(),
                googleFacebookRow(),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(title: "Don’t have an account yet?",color: black,fontWeight: w400,size: 12,),
                    InkWell(
                        onTap: (){
                          Get.to(RegisterPage1());
                        },
                        child: MyText(title: " Register",color: lightPurple,fontWeight: w400,size: 12,)),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
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
