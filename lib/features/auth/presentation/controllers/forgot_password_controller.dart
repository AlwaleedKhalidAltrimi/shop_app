import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final emailController = TextEditingController();

  // Form state
  // Password visibility
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();

      // هنا ضع منطق استرجاع كلمة المرور
      print('Email: $email');
    }
  }
}
