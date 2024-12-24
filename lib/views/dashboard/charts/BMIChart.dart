// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//
// class BMIPieChart extends StatelessWidget {
//   final double bmi;
//
//   const BMIPieChart({Key? key, required this.bmi}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PieChart(
//       PieChartData(
//         sections: [
//           PieChartSectionData(
//             value: bmi,
//             color: Colors.blue,
//             title: '${bmi.toStringAsFixed(1)}',
//             titleStyle: TextStyle(color: Colors.white),
//           ),
//           PieChartSectionData(
//             value: 25 - bmi, // Assuming max BMI value is 25 for this example
//             color: Colors.grey,
//             title: '',
//           ),
//         ],
//         centerSpaceRadius: 40,
//       ),
//     );
//   }
// }
