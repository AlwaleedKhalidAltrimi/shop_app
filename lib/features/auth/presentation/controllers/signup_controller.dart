import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Form state
  // Password visibility
  RxBool isPasswordHidden = true.obs;
  // Terms acceptance
  RxBool termsAccepted = false.obs;
  RxBool isLoading = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  // Toggle terms and conditions acceptance
  void toggleTermsAccepted(bool? value) {
    termsAccepted.value = value ?? false;
  }

  // Signup function placeholder
  void signUpUsingFirebase() {
    if (formKey.currentState!.validate()) {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      // هنا ضع منطق التسجيل
      print('Name: $name, Email: $email, Password: $password');
    }
  }

  // Dispose controllers when controller is removed
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
