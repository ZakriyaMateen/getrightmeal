
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/RegisterAndLoginControllers/RegisterPage3Controller.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/views/signupAndLogin/LoginPage.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage4.dart';
import 'package:getrightmeal/views/signupAndLogin/SuccessRegistrationScreen.dart';

import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class RegisterPage3 extends StatefulWidget {
  const RegisterPage3({super.key});

  @override
  State<RegisterPage3> createState() => _RegisterPage3State();
}

class _RegisterPage3State extends State<RegisterPage3> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController(); // Updated CarouselController

  // Sample images for the carousel
  final List<Map<String,dynamic>> imageList = [
    {
      'image':'goal1.png',
      'goal':'Lose Weight',
      'subtitle':'Gradually achieve your ideal weight',
    },
    {
      'image':'goal2.png',
      'goal':'Maintain Weight',
      'subtitle':'Sustain your current weight with well-structured nutrition',
    },
    {
      'image':'goal3.png',
      'goal':'Gain Muscle',
      'subtitle':'Build lean muscle mass with a balanced diet',
    },

  ];

  RegisterPage3Controller controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  title: "What is your goal?",
                  fontWeight: w700,
                  color: black,
                  size: size18,
                ),
                MyTextOverflow(
                  title: "It will help us to choose the best program for you",
                  fontWeight: w400,
                  color: plumGrey,
                  size: size10,
                ),
              ],
            ),
            CarouselSlider.builder(
              carouselController: _carouselController, // Use the CarouselController
              itemCount: imageList.length,
              options: CarouselOptions(
                height: Get.height * 0.7,
                enlargeCenterPage: true, // Makes the center image larger
                viewportFraction: 0.7, // Controls the size of the non-center images
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                enableInfiniteScroll: false, // Disable infinite scroll
                // scrollPhysics: NeverScrollableScrollPhysics(), // Disable manual scrolling
              ),
              itemBuilder: (context, index, realIndex) {
                bool isCenterImage = _currentIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                    _carouselController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    print("Image $index tapped");
                  },
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      gradient: blueGradient,
                      borderRadius: BorderRadius.circular(22)
                    ),
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Transform.scale(
                      scale: isCenterImage ? 0.9   : 0.7, // Larger scale for center image
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(

                            imageList[index]['image'],
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10,),

                          MyTextOverflow(
                            title: imageList[index]['goal'],
                            color: white,
                            fontWeight: w600,
                            size: size17,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:
                            MyTextOverflow(
                              title: imageList[index]['subtitle'],
                              color: white,
                              textAlign: TextAlign.center,
                              fontWeight: w400,
                              size: size11,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: InkWell(
                onTap: () {
                  controller.selectedIndex.value = _currentIndex;
                  Get.to(RegisterPage4());

                    // Here you can add navigation logic to the next page

                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: blueGradient,
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Obx(()=>Center(
                    child: controller.isLoading.value?

                    CupertinoActivityIndicator():
                    MyText(
                      title: 'Continue',
                      size: 15,
                      fontWeight: w700,
                      color: white,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



