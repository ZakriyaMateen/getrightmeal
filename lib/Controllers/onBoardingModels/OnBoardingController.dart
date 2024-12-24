import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  List<String> onBoardingImagesPaths = [
    'onBoardingImage1.png',
    'onBoardingImage2.png',
    'onBoardingImage3.png',
    'onBoardingImage4.png',
  ];
  List<String> titles = [
    'Track Your Goal',
    'Get Burn',
    'Eat Well',
    'Improve Sleep Quality',
  ];
  List<String> subtitles = [
    "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
    "Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
    "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
    "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
  ];
  RxInt index = 0.obs;

  void changeIndex(){
    index++;
  }

}