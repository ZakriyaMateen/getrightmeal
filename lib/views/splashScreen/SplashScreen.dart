import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getrightmeal/Controllers/splashScreenController/SplashScreenController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenController splashScreenController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('logo.png',fit: BoxFit.contain,),
      ),
    );
  }
}
