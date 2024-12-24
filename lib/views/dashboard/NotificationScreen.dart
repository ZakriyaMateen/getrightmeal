import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/widgets/Text.dart';

import '../../constants/Colors.dart';
import '../../constants/Sizes.dart';
import '../../constants/fontWeights.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Map<String,dynamic>> notifications = [

    {
      'imageUrl':'notifications1.png',
      'title':'Hey, it’s time for lunch',
      'time':'About 1 minutes ago'
    }, {
      'imageUrl':'notifications2.png',
      'title':'Don’t miss your lowerbody workout',
      'time':'About 3 hours ago'
    }, {
      'imageUrl':'notifications1.png',
      'title':'Hey, let’s add some meals for your body',
      'time':'About 3 hours ago'
    }, {
      'imageUrl':'notifications1.png',
      'title':'Congratulations, You have finished meal',
      'time':'29 May'
    }, {
      'imageUrl':'notifications1.png',
      'title':'Hey, it’s time for lunch',
      'time':'8 April'
    }, {
      'imageUrl':'notifications1.png',
      'title':'Ups, You have missed your Lowerbody workout',
      'time':'3 April'
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: white,
      body:   SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: Get.width*0.05,right: Get.width*0.05,top: Get.height*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationScreenAppBar(),
                  SizedBox(height: 15,),


              ListView.builder(itemBuilder: (context,index){
                return Container(
                  width: Get.width,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: grey,width: 1))
                  ),
                  child: ListTile(
                    onTap: (){},
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(notifications[index]['imageUrl']),
                    ),
                    title: MyText(
                      textAlign: TextAlign.left,
                      
                      title: notifications[index]['title'],
                      fontWeight: w500,
                      size: size12,
                      color: black,
                    ),
                    subtitle: MyText(
                      textAlign: TextAlign.left,
                      title: notifications[index]['title'],
                      fontWeight: w400,
                      size: size10,
                      color: plumGrey,
                    ) ,
                    trailing: Icon(Icons.more_vert,color: plumGrey,size: 17,),
                  ),
                );
              },itemCount: notifications.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)


            ],
          ),
        ),
      ),
    );
  }

  Widget NotificationScreenAppBar(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: textFieldColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(Icons.arrow_back_ios_new_rounded,color: black,size: 15,),
            ),
          ),
        ),


        MyText(title: 'Notification', color: black, fontWeight: w700,size: size15,),
        InkWell(
          onTap: (){
            // Get.back();
          },
          child: Container(
            width: 40,
            height: 40,
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
    );

  }

}
