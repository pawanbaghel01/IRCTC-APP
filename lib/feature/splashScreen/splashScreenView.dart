import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) => Scaffold(
        body:Stack(
        children: [
          Image.asset(
            'assets/train4.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ]),
      ),
    );
  }
}
