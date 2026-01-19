import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeScaleAnimation;

  @override
  void onInit() {
    super.onInit();
    _initFadeScaleAnimation();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void _initFadeScaleAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    fadeScaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();
  }
}
