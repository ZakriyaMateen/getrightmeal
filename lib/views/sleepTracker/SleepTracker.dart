import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';

import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepTracker extends StatefulWidget {
  const SleepTracker({super.key});

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05, top: Get.height * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              sleepTrackerAppBar(),
              SizedBox(height: 10,),
              lastNightSleepContainer(w),
              SizedBox(height: 10,),
              Container(
                width: w,
                height: 50,
                decoration:BoxDecoration(
                    color: lightBlue.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16)
                ),
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      title: 'Daily Sleep Schedule',
                      color: black,
                      size: size13,
                      fontWeight: w500,
                    ),
                    Container(
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        gradient: blueGradient,
                        borderRadius: BorderRadius.circular(80)
                      ),
                      child: Center(
                        child: MyText(
                          title: 'Check',
                          color: white,
                          fontWeight: w500,
                          size: size13,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Row(
                children: [
                  MyText(
                    title: 'Today Schedule',
                    color: black,
                    fontWeight: w600,
                    size: size15,
                  )
                ],
              )    ,
              
              SizedBox(height: 10,),
              
              
              ListView.builder(itemBuilder: (context,index){
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
              },itemCount: 5,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)



            ],
          ),
        ),
      ),
    );
  }

  Widget lastNightSleepContainer(double w){
    return  Container(
      width: w ,
      height: 140,
      decoration: BoxDecoration(
          gradient: blueGradient,
          borderRadius: BorderRadius.circular(22)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: 10,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: 'Last Night Sleep',
                  color: white,
                  size: size13,
                  fontWeight: w500,
                ),
                SizedBox(height: 2,),
                MyText(
                  title: '8h 20m',
                  color: white,
                  size: size15,
                  fontWeight: w500,
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),

          Container(
            width: w,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child:Image.asset('sleepLines1.png',width: w,fit: BoxFit.cover,),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:Image.asset('sleepLines2.png',width: w,fit: BoxFit.cover,),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget sleepTrackerAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new_rounded, color: black, size: 15),
            ),
          ),
        ),
        MyText(title: 'Sleep Tracker', color: black, fontWeight: w700, size: size15),
        InkWell(
          onTap: () {
            // Handle more actions
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: textFieldColor, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Icon(Icons.more_horiz, color: black, size: 15),
            ),
          ),
        ),
      ],
    );
  }





}


// class LineChartSample extends StatefulWidget {
//   @override
//   _LineChartSampleState createState() => _LineChartSampleState();
// }
//
// class _LineChartSampleState extends State<LineChartSample> {
//   final List<FlSpot> spots = [
//     FlSpot(0, 2), // Sun
//     FlSpot(1, 3), // Mon
//     FlSpot(2, 5), // Tue
//     FlSpot(3, 4), // Wed
//     FlSpot(4, 6), // Thu
//     FlSpot(5, 5), // Fri
//     FlSpot(6, 8), // Sat
//   ];
//
//   int? touchedIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weekly Hours Chart'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 300,
//             child: LineChart(
//               LineChartData(
//                 titlesData: FlTitlesData(
//                   leftTitles: SideTitles(showTitles: true, reservedSize: 40),
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 30,
//                     getTitlesWidget: (value, meta) {
//                       switch (value.toInt()) {
//                         case 0:
//                           return const Text('Sun');
//                         case 1:
//                           return const Text('Mon');
//                         case 2:
//                           return const Text('Tue');
//                         case 3:
//                           return const Text('Wed');
//                         case 4:
//                           return const Text('Thu');
//                         case 5:
//                           return const Text('Fri');
//                         case 6:
//                           return const Text('Sat');
//                         default:
//                           return const Text('');
//                       }
//                     },
//                   ),
//                 ),
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: spots,
//                     isCurved: true,
//                     colors: [Colors.blue],
//                     belowBarData: BarAreaData(show: true, colors: [Colors.blue.withOpacity(0.2)]),
//                     dotData: FlDotData(show: true),
//                   ),
//                 ],
//                 borderData: FlBorderData(show: true),
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(show: true),
//                 touchData: LineTouchData(
//                   touchTooltipData: LineTouchTooltipData(
//                     tooltipBgColor: Colors.blueAccent,
//                     getTooltipItems: (touchedSpots) {
//                       return touchedSpots.map((touchedSpot) {
//                         final index = touchedSpot.x.toInt();
//                         final yValue = spots[index].y;
//
//                         // Calculate percentage change
//                         String percentChange;
//                         if (index > 0) {
//                           final previousY = spots[index - 1].y;
//                           final change = ((yValue - previousY) / previousY) * 100;
//                           percentChange = change.toStringAsFixed(2) + '%';
//                         } else {
//                           percentChange = 'N/A'; // No previous data for the first point
//                         }
//
//                         return LineTooltipItem(
//                           'Day: ${['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index]}\n'
//                               'Hours: ${yValue}h\n'
//                               'Change: ${percentChange}',
//                           TextStyle(color: Colors.white),
//                         );
//                       }).toList();
//                     },
//                   ),
//                   handleBuiltInTouches: true,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
