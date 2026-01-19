import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Form state
  // Password visibility
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  // signIn function placeholder
  void signInUsingFirebase() {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // هنا ضع منطق التسجيل
      print('Email: $email, Password: $password');
    }
  }

  // Dispose controllers when controller is removed
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
