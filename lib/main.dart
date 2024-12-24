import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/AccessTokenController.dart';
import 'package:getrightmeal/Controllers/splashScreenController/SplashScreenController.dart';
import 'package:getrightmeal/state.dart';
import 'package:getrightmeal/views/BottomNavBar/CustomBottomNavBar.dart';
import 'package:getrightmeal/views/dashboard/HomeScreen.dart';
import 'package:getrightmeal/views/dashboard/ProfileScreen.dart';
import 'package:getrightmeal/views/mealPlanner/MealSchedule.dart';
import 'package:getrightmeal/views/onBoarding/OnBoarding.dart';
import 'package:getrightmeal/views/onBoarding/Screen1.dart';
import 'package:getrightmeal/views/signupAndLogin/LoginPage.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage1.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage2.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage3.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage4.dart';
import 'package:getrightmeal/views/signupAndLogin/RegisterPage5.dart';
import 'package:getrightmeal/views/signupAndLogin/VerifyOtpScreen.dart';
import 'package:getrightmeal/views/splashScreen/SplashScreen.dart';

import 'Controllers/ProgressTrackerControllers/ResultScreenController.dart';
import 'Controllers/ProgressTrackerControllers/TakePhotoController.dart';
import 'Controllers/RegisterAndLoginControllers/LoginPageController.dart';
import 'Controllers/RegisterAndLoginControllers/RegisterPage1Controller.dart';
import 'Controllers/RegisterAndLoginControllers/RegisterPage2Controller.dart';
import 'Controllers/RegisterAndLoginControllers/RegisterPage3Controller.dart';
import 'Controllers/onBoardingModels/OnBoardingController.dart';
import 'Controllers/onBoardingModels/Screen1Controller.dart';

void main() async{
    // MobileAds.instance.initialize();  // Initialize Google Mobile Ads SDK
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Screen1Controller screen1controller = Get.put(Screen1Controller());
    OnBoardingController onBoardingController = Get.put(OnBoardingController());
    RegisterPage1Controller registerPage1Controller = Get.put(RegisterPage1Controller());
    RegisterPage2Controller registerPage2Controller = Get.put(RegisterPage2Controller());
    RegisterPage3Controller registerPage3Controller = Get.put(RegisterPage3Controller());
    LoginPageController loginPageController = Get.put(LoginPageController());
    TakePhotoController takePhotoController = Get.put(TakePhotoController());
    ResultScreenController resultScreenController = Get.put(ResultScreenController());
    AccessTokenController accessTokenController = Get.put(AccessTokenController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Right Meal',
      theme: ThemeData.light(),
      home: newWidget(),
    );
  }


}
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   BannerAd? _bannerAd;
//   bool _isLoaded = false;
//
//   // TODO: replace this test ad unit with your own ad unit.
//   final  adUnitId = Platform.isAndroid
//       ? 'ca-app-pub-3940256099942544/9214589741'
//       : 'ca-app-pub-3940256099942544/2435281174';
//
//   /// Loads a banner ad.
//   void loadAd() {
//     _bannerAd = BannerAd(
//       adUnitId: adUnitId,
//       request: const AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           debugPrint('$ad loaded.');
//           setState(() {
//             _isLoaded = true;
//           });
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (ad, err) {
//           debugPrint('BannerAd failed to load: $err');
//           // Dispose the ad here to free resources.
//           ad.dispose();
//         },
//       ),
//     )..load();
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadAd();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: _bannerAd  !=null?Align(
//           alignment: Alignment.bottomCenter,
//           child: SafeArea(
//             child: SizedBox(
//               width: _bannerAd!.size.width.toDouble(),
//               height: _bannerAd!.size.height.toDouble(),
//               child: AdWidget(ad: _bannerAd!),
//             ),
//           ),
//         ):Text('No Ad'),
//       ),
//     );
//   }
// }
//
//
//
// //
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   BannerAd? _bannerAd;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadBannerAd();
// //   }
// //
// //   void _loadBannerAd() {
// //     _bannerAd = BannerAd(
// //       size: AdSize(width: 100, height:100),
// //       adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Replace with your Ad Unit ID
// //       request: AdRequest(),
// //       listener: BannerAdListener(
// //         onAdLoaded: (_) {
// //           setState(() {}); // Update the UI when the ad is loaded
// //         },
// //         onAdFailedToLoad: (ad, error) {
// //           ad.dispose(); // Dispose of the ad on error
// //         },
// //       ),
// //     )..load();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _bannerAd?.dispose(); // Dispose of the ad when the widget is disposed
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('AdMob Example')),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text('Hello, Flutter!'),
// //             if (_bannerAd != null && !_bannerAd!.isBlank!)
// //               Container(
// //                 height: 50,
// //                 child: AdWidget(ad: _bannerAd!),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
