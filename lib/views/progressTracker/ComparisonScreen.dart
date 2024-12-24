import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/views/progressTracker/Results/ResultScreenHolder.dart';
import '../../Controllers/ProgressTrackerControllers/ComparisonScreenController.dart';
import '../../constants/Colors.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';
import '../../widgets/Text.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  final ComparisonScreenController controller = Get.put(ComparisonScreenController()); // Initialize controller

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
              SizedBox(height: 20),
              comparisonScreenAppBar(),
              SizedBox(height: 20),
              // First Month Selector
              Obx(() => buildMonthSelector(
                  'Select Month 1', controller.selectedMonth1.value, controller.updateMonth1)),
              SizedBox(height: 8),
              // Second Month Selector
              Obx(() => buildMonthSelector(
                  'Select Month 2', controller.selectedMonth2.value, controller.updateMonth2)),



              InkWell(
                onTap: (){
                  Get.to(ResultScreenHolder());
                },
                child: Container(
                  width: w,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: blueGradient,
                    borderRadius: BorderRadius.circular(80)
                  ),
                  child: Center(
                    child: MyText(
                      title: 'Compare',
                      size: size15,
                      color: white,
                      fontWeight: w700,
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget buildMonthSelector(String title, String selectedMonth, Function(String) onUpdate) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        // Implement a month selection logic, e.g., open a dialog to select a month
        selectMonth(onUpdate);
      },
      child: Container(
        width: w,
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 45,
        decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('dateIcon.png', width: 16, height: 16, fit: BoxFit.contain),
                SizedBox(width: 4),
                MyText(
                  title: title,
                  color: plumGrey,
                  fontWeight: w400,
                  size: size12,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  title: selectedMonth,
                  color: plumGrey,
                  fontWeight: w400,
                  size: size11,
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, color: plumGrey, size: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectMonth(Function(String) onUpdate) async {
    // Show a dialog or use a Date Picker to select the month
    List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    String? selectedMonth = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Month'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: months
                  .map((month) => ListTile(
                title: Text(month),
                onTap: () {
                  Navigator.of(context).pop(month); // Return selected month
                },
              ))
                  .toList(),
            ),
          ),
        );
      },
    );

    if (selectedMonth != null) {
      onUpdate(selectedMonth); // Update the selected month in the controller
    }
  }

  Widget comparisonScreenAppBar() {
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
        MyText(title: 'Progress Photo', color: black, fontWeight: w700, size: size15),
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
