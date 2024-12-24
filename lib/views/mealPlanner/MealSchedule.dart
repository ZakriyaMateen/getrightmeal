import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:intl/intl.dart';

import '../../Controllers/mealPlannerControllers/MealScheduleController.dart';
import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';





class MealSchedule extends StatefulWidget {
  const MealSchedule({super.key});

  @override
  State<MealSchedule> createState() => _MealScheduleState();
}

class _MealScheduleState extends State<MealSchedule> {

  MealScheduleController controller = Get.put(MealScheduleController());
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: Obx(()=>controller.isLoading.value?
          Center(child: CupertinoActivityIndicator(),):
      RefreshIndicator(

        onRefresh: controller.fetch,

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              mealScheduleAppBar(),
              SizedBox(height: 10,),
              Obx(()=> MyText(
                title:controller.meals[controller.selectedIndex.value].date
              ),),
              SizedBox(height: 10,),
              Container(
                height: 70, // Adjust the height as per your needs
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.meals.length,
                  itemBuilder: (context, index) {
                    final date = extractDate(controller.meals[index].date);
                    final day = controller.meals[index].day.substring(0,3);

                    return GestureDetector(
                      onTap: () {
                        controller.selectDate(index); // Update selected index
                      },
                      child: Obx(()=>Container(
                        width: 50, // Adjust width if needed
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: controller.selectedIndex.value == index ? blueGradient : null,
                          color: controller.selectedIndex.value != index ? textFieldColor : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              title: date, // Day (Mon, Tue, etc.)
                              color: controller.selectedIndex.value == index ? white : plumGrey,
                              fontWeight: w400,
                              size: size11,
                            ),
                            SizedBox(height: 4),
                            MyText(
                              title: day, // Date (01, 02, etc.)
                              color: controller.selectedIndex.value == index ? white : plumGrey,
                              fontWeight: w500,
                              size: size13,
                            ),
                          ],
                        ),
                      )),
                    );
                  },
                ),
              ),

              SizedBox(height: 15,),


              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    mealHeadingRow('Breakfast'),
                    SizedBox(height: 10,),
                   foodContainer('clockIcon.png',controller.meals[controller.selectedIndex.value].meals.breakfast,w),

          // ListView.builder(itemBuilder: (context,index){
                    // },shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 1,),
                     SizedBox(height: 15,),
                    mealHeadingRow('Lunch'),
                    SizedBox(height: 10,),
                    foodContainer('clockIcon.png',controller.meals[controller.selectedIndex.value].meals.breakfast,w),
                    SizedBox(height: 15,),

                    mealHeadingRow('Dinner'),
                    SizedBox(height: 10,),
                    foodContainer('clockIcon.png',controller.meals[controller.selectedIndex.value].meals.breakfast,w),
                    SizedBox(height: 15,),

                    // mealHeadingRow('Today Meal Nutritions'),
                    // SizedBox(height: 10,),
                    // ListView.builder(itemBuilder: (context,index){
                    //   return foodContainer('clockIcon.png', 'Honey Pancake','07:00am');
                    // },shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: 2,),
                    // SizedBox(height: 15,),

                  ],
                ),
              ),
              SizedBox(height: Get.height*0.5,),
            ],
          ),
        ),
      )

      ),
    );
  }

  String extractDate(String dateString){
    // Define the format of the input date string
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    // Parse the string into a DateTime object
    DateTime dateTime = dateFormat.parse(dateString);

    // Extract the day
    return dateTime.day.toString();
  }


  Widget foodContainer(String imagePath, String title,double w){
    Random random = Random();

   int index = random.nextInt(6);
    List myColors = [
      black,
      lightPurple,
      lightBlue,
      darkPurple,
      darkBlue,
      plumGrey,
      grey,
      green,
      dustyRose,
      textFieldColor,
      red,
    ];
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [  Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: myColors[index].withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Center(
                child: Image.asset(imagePath,fit: BoxFit.contain,width: 25,height: 25,),
              ),
            ),
              SizedBox(width: 4,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: w*0.6,
                  child:    MyTextOverflow(
                    title: title,
                    color: black,
                    size: size13,
                    fontWeight: w500,
                  ),
                  ),
                  SizedBox(height: 1,),
                  // MyText(
                  //   title: time,
                  //   color: plumGrey,
                  //   size: size11,
                  //   fontWeight: w400,
                  // )
                  //Uncomment the above to add time
                ],
              ),
            ],
          ),
            
          Image.asset('arrowRightIcon.png',width: 15,height: 15,fit: BoxFit.contain,)
          
        ],
      ),
    );
  }


  Widget mealHeadingRow(String title){

    return
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
            title: title,
            color: black,
            fontWeight: w600,
            size: size15,
          ),
        ],
      );
  }
  Widget mealScheduleAppBar(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          InkWell(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Icon(Icons.arrow_back_ios_new_rounded,color: black,size: 15,),
              ),
            ),
          ),


          MyText(title: 'Meal Schedule', color: black, fontWeight: w700,size: size15,),
          InkWell(
            onTap: (){
              // Get.back();
            },
            child: Container(
              width: 30,
              height: 30,
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
      ),
    );

  }


}
