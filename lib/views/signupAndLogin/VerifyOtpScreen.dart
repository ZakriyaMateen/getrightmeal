import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/widgets/Text.dart';
import 'package:pinput/pinput.dart';

import '../../Controllers/RegisterAndLoginControllers/LoginPageController.dart';
import '../../Controllers/RegisterAndLoginControllers/VerifyOtpScreenController.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController pinController = TextEditingController();
  // ResetPasswordController controller = Get.put(ResetPasswordController());
  LoginPageController loginPageController = Get.find();
  VerifyOtpScreenController controller = Get.put(VerifyOtpScreenController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.white),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: darkBlue),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    "logo.png",
                    width: Get.width * 0.9,
                    height: 65,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "otp.png",
                      height: 55,
                    ),
                  ),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(left: 24),
                //   child: Text("Verification Code",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 23,
                //           fontWeight: FontWeight.bold)),
                // ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 5),
                  child: Text(
                    "We have sent you a verification email on ${widget.email}\nCheck enter the OTP code",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 40),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    onCompleted: (pin) async {
                        controller.otp.value = pin;
                        controller.email.value = widget.email;
                        await controller.postData();
                    },
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: OutlinedButton(
                      child: Obx(()=>controller.isLoading.value?
                      CupertinoActivityIndicator():
                      MyText(title: 'Verify')
                      ),
                      onPressed: () async{
                        if (controller.validation()) {
                          controller.email.value = widget.email;
                          await controller.postData();
                        }
                        // verifyOtpController.postData();
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: Get.width * 0.78,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: darkBlue, width: 0.5)),
                    child: TextButton(
                        child: const MyText(
                          title: 'Resend OTP',
                          size: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        onPressed: () async{
                          await loginPageController.postData();// if (controller.validation()) {
                          //   controller.email.value = widget.email;
                          //   await controller.postData();
                          // }
                        }),
                  ),
                )              ],
            ),
          ),
        ),
      ),
    );
  }
}
