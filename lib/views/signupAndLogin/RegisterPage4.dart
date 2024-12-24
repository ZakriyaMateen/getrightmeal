import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/constants/Colors.dart';
import 'package:getrightmeal/constants/Gradients.dart';
import 'package:getrightmeal/constants/fontWeights.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../Controllers/RegisterAndLoginControllers/RegisterPage4Controller.dart';
import '../../constants/Sizes.dart';
import 'RegisterPage5.dart';


class RegisterPage4 extends StatefulWidget {
  const RegisterPage4({super.key});

  @override
  State<RegisterPage4> createState() => _RegisterPage4State();
}



class _RegisterPage4State extends State<RegisterPage4> {

  RegisterPage4Controller controller = Get.put(RegisterPage4Controller());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              MyTextOverflow(
                title: 'Dietary Preferences',
                textAlign: TextAlign.center,
                color: black,
                fontWeight: w600,
                size: size17,
              ),
              SizedBox(height: 10),
             Obx(()=> GridView.builder(

               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
               itemBuilder: (context, index) {
                 return GestureDetector(
                     onTap: () {
                       controller.selectIndex(index);
                     },
                     child:Container(
                       margin: EdgeInsets.only(top: 5,right: 5,left: 5),
                       decoration: BoxDecoration(
                         gradient: (controller.preferences[index]['isSelected'] as bool) ? blueGradient : blueGradientLight,

                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: Center(
                         child: MyTextOverflow(
                           title: controller.preferences[index]['title'].toString(),
                           color: white,
                           fontWeight: w500,
                           size: size12,
                         ),
                       ),
                     ));
               },
               itemCount: controller.preferences.length,
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
             )),

              SizedBox(height: 40,),
              Obx(() => GestureDetector(
                onTap: () {
                  List<int> selectedIndices = controller.getSelectedIndices();
                   if(selectedIndices.isNotEmpty){
                     Get.to(RegisterPage5());
                   }
                  // You can handle the selected indices further here
                },
                child: Container(
                  width: w,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: controller.preferences.any((element) => element['isSelected'] as bool)
                        ? blueGradient
                        : blueGradientLight,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Center(
                    child: MyTextOverflow(
                      title: 'Continue',
                      size: size17,
                      color: white,
                      fontWeight: w600,
                    ),
                  ),
                ),
              ))

            ],
          ),
        ),
      ),
    );
  }
}
