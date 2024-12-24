import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:getrightmeal/constants/Colors.dart';

class Heartratechart extends StatelessWidget {
  const Heartratechart({super.key});

  @override
  Widget build(BuildContext context) {
    List<FlSpot> chartData = [
      FlSpot(0, 1),
      FlSpot(1, 3),
      FlSpot(2, 10),
      FlSpot(3, 7), // Uncommented to add this data point
      FlSpot(4, 12),
      // FlSpot(5, 13),
      // FlSpot(6, 17),
      FlSpot(7, 15),
      FlSpot(8, 20),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false), // Hide grid lines
          borderData: FlBorderData(show: false), // Hide the border
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide bottom titles
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide left titles
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide top titles
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide right titles
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: chartData,
              isCurved: false,
              color: darkBlue, // Change color as needed
              belowBarData: BarAreaData(show: false), // No fill below the line
              aboveBarData: BarAreaData(show: false), // No fill above the line
              dotData: FlDotData(show: false), // Hide dots on the line
            ),
          ],
        ),
      ),
    );
  }
}
