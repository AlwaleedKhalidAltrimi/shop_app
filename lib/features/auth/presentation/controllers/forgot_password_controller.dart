import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/show_custom_toast.dart';
import '../../../../core/functions/show_error.dart';
import '../../../../core/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final emailController = TextEditingController();

  // Form state
  RxBool isLoading = false.obs;

  // Firebase Authentication singleton instance
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> resetPassword() async {
    debugPrint('Validating forgot password form...');
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final email = emailController.text.trim();

      try {
        debugPrint('Sending password reset email to: $email');
        await auth.sendPasswordResetEmail(email: email);
        debugPrint('Password reset email sent successfully');

        // Successfully sent reset email
        if (!isClosed) {
          isLoading.value = false;
        }

        debugPrint('Navigating to login screen');
        showCustomToast("Check your email to reset your password");
        Get.offAllNamed(AppRoutes.login);
      } on FirebaseAuthException catch (e) {
        debugPrint(
          'FirebaseAuthException during password reset: ${e.code} - ${e.message}',
        );
        _resetPasswordHandleException(e);
      } catch (e, stackTrace) {
        debugPrint("********** Unknown error during password reset: $e");
        debugPrint("Stack trace: $stackTrace");
        if (!isClosed) {
          isLoading.value = false;
        }
        if (!isClosed) {
          showError("Failed to send reset password email");
        }
      }
    }
  }

  void _resetPasswordHandleException(FirebaseAuthException e) {
    debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
    if (!isClosed) {
      isLoading.value = false;
    }

    switch (e.code) {
      case 'user-not-found':
        showError("No user found for that email");
        break;
      case 'invalid-email':
        showError("The email address is invalid.");
        break;
      case 'too-many-requests':
        showError("Too many requests. Please try again later.");
        break;
      default:
        if (!isClosed) {
          showError(
            "Failed to send reset password email: ${e.message ?? 'Unknown error'}",
          );
        }
    }
  }
}
