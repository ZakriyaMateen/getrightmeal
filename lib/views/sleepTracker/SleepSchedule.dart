import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/Colors.dart';
import '../../constants/Gradients.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class SleepSchedule extends StatefulWidget {
  SleepSchedule({super.key});

  @override
  _SleepScheduleState createState() => _SleepScheduleState();
}

class _SleepScheduleState extends State<SleepSchedule> {
  final List<DateTime> dates = List<DateTime>.generate(
      30, (index) => DateTime.now().add(Duration(days: index)));
  int selectedIndex = 0; // Track the selected index

  void selectDate(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(

      floatingActionButton: FloatingActionButton(mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: (){},
      child: Container(width: 40,height: 40,decoration: BoxDecoration(gradient: purpleGradient,shape: BoxShape.circle),child: Center(child: Icon(Icons.add,color: white,size: size15,),),),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * 0.05,
                right: Get.width * 0.05,
                top: Get.height * 0.04,
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  sleepScheduleAppBar(),
                  SizedBox(height: 10),
                  Container(
                    width: w,
                    height: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: darkBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(
                              title: 'Ideal Hours for Sleep',
                              color: black,
                              size: size11,
                              fontWeight: w400,
                            ),
                            MyText(
                              title: '8 hours 30 minutes',
                              color: darkBlue,
                              size: size13,
                              fontWeight: w500,
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 65,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                gradient: blueGradient,
                              ),
                              child: Center(
                                child: MyText(
                                  title: 'Learn More',
                                  color: white,
                                  size: size9,
                                  fontWeight: w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'sleepScheduleImage.png',
                          width: w * 0.3,
                          height: w * 0.3,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      MyText(
                        title: 'Your Schedule',
                        color: black,
                        size: size15,
                        fontWeight: w600,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Date Picker Section
                ],
              ),
            ),
            Container(
              height: 70, // Adjust the height as per your needs
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      selectDate(index); // Update selected index
                    },
                    child: Container(
                      width: 50, // Adjust width if needed
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: isSelected ? blueGradient : null,
                        color: !isSelected ? textFieldColor : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            title: DateFormat('E').format(date), // Day (Mon, Tue, etc.)
                            color: isSelected ? white : plumGrey,
                            fontWeight: w400,
                            size: size11,
                          ),
                          SizedBox(height: 4),
                          MyText(
                            title: DateFormat('dd').format(date), // Date (01, 02, etc.)
                            color: isSelected ? white : plumGrey,
                            fontWeight: w500,
                            size: size13,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
              child: ListView.builder(itemBuilder: (context,index){
                return Card(
                  elevation: 3,
                  color: white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: w,
                    height: 75,
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('bedImage.png',width: 30,height: 30,fit: BoxFit.contain,),
                            SizedBox(width: 3,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    MyText(
                                      title: 'Bedtime',
                                      color: black,
                                      size: size13,
                                      fontWeight: w500,
                                    )        ,MyText(
                                      title: '09:00pm',
                                      color: plumGrey,
                                      size: size11,
                                      fontWeight: w400,
                                    )        ,
                                  ],
                                ),
                                MyText(
                                  title: 'in 6hours 22minutes',
                                  color: black,
                                  size: size13,
                                  fontWeight: w500,
                                )
                              ],
                            ),


                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.more_vert,color: plumGrey,size: 14,),
                            SizedBox(height: 3,),
                            Switch(value: false, onChanged: (v){},splashRadius: 2,focusColor: darkPurple,
                              activeTrackColor:darkPurple,
                              activeColor: white,
                              inactiveThumbColor: darkPurple,
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                );
              },itemCount: 5,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
            )
          ],
        ),
      ),
    );
  }

  Widget sleepScheduleAppBar() {
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
        MyText(title: 'Sleep Schedule', color: black, fontWeight: w700, size: size15),
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
