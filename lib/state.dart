import 'package:flutter/material.dart';
import 'package:get/get.dart';

class newWidget extends StatelessWidget {
   newWidget({Key? key}) : super(key: key);

  Counter controller = Get.put(Counter());

  @override
  Widget build(BuildContext context) {
    print("heloo");
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 500,),
          Obx(()=>Text(controller.count.toString())),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
                controller.count++;
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}

class Counter extends GetxController{

  var count = 0.obs;

}

