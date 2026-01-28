import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/get_storage.dart';
import '../../../../core/functions/show_custom_toast.dart';
import '../../../../core/functions/show_error.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/custom_snackbar.dart';

class SignupController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Getters (Trimmed Values)
  String get name => nameController.text.trim();
  String get email => emailController.text.trim();
  String get password => passwordController.text.trim();

  // Form state
  // Password visibility
  RxBool isPasswordHidden = true.obs;
  // Terms acceptance
  RxBool termsAccepted = false.obs;
  RxBool isLoading = false.obs;

  // Firebase Authentication singleton instance
  FirebaseAuth auth = FirebaseAuth.instance;
  // Firebase Firestore singleton instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  // Toggle terms and conditions acceptance
  void toggleTermsAccepted(bool? value) {
    termsAccepted.value = value ?? false;
  }

  Future<void> signUpUsingFirebase() async {
    if (!termsAccepted.value) {
      // Show error message if terms are not accepted
      // showError("Please accept the terms and conditions");
      showCustomSnackBar(
        title: "Warning",
        message: "Please accept the terms and conditions",
        type: SnackType.warning,
      );
      return;
    }

    debugPrint('Validating sign up form...');
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      try {
        debugPrint('Creating user with email: $email');
        final userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint('User created successfully: ${userCredential.user?.uid}');

        // Add user profile to Firestore
        debugPrint('Adding user profile to Firestore');
        await _addUserProfile();
        debugPrint('User profile added successfully');

        // Send email verification
        debugPrint('Sending email verification');
        await _verifyEmail();
        debugPrint('Email verification sent');

        // Store user data in GetStorage
        final user = auth.currentUser;
        if (user != null) {
          debugPrint('Storing user data in GetStorage');
          await GetStorageUtil.setUserData(
            userId: user.uid,
            userEmail: user.email,
            userName: name,
          );
          debugPrint('User data stored successfully');
        }

        // Successfully created user
        if (!isClosed) {
          isLoading.value = false;
        }

        showCustomToast(
          "Successfully, Check your email to verify your account",
          type: ToastType.success,
        );
        Get.offAllNamed(AppRoutes.login);
      } on FirebaseAuthException catch (e) {
        debugPrint('FirebaseAuthException: ${e.code} - ${e.message}');
        _signUpHandleException(e);
      } catch (e, stackTrace) {
        debugPrint("********** Unknown error: $e");
        debugPrint("Stack trace: $stackTrace");
        if (!isClosed) {
          isLoading.value = false;
        }
        showError("An unknown error occurred: ${e.toString()}");
      }
    }
  }

  void _signUpHandleException(FirebaseAuthException e) {
    debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
    if (!isClosed) {
      isLoading.value = false;
    }

    switch (e.code) {
      case 'weak-password':
        showError(
          "The password provided is too weak. Please choose a stronger password.",
        );
        break;
      case 'email-already-in-use':
        showError("The account already exists for that email.");
        break;
      case 'invalid-email':
        showError("The email address is invalid.");
        break;
      case 'operation-not-allowed':
        showError("Email/password accounts are not enabled.");
        break;
      case 'too-many-requests':
        showError("Too many requests. Please try again later.");
        break;
      default:
        showError("An error occurred: ${e.message ?? 'Unknown error'}");
    }
  }

  // Future<void> verifyEmail() async {
  //   await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  // }

  Future<void> _verifyEmail() async {
    try {
      final user = auth.currentUser;
      if (user != null && !user.emailVerified) {
        // await user.reload(); // إعادة تحميل بيانات المستخدم
        await user.sendEmailVerification();
        debugPrint('Verification email sent to ${user.email}');
      }
    } catch (e) {
      debugPrint('Error sending verification email: $e');
      // Don't throw error here, just log it. Email verification is not critical for sign up
    }
  }

  Future<void> _addUserProfile() async {
    try {
      CollectionReference users = firestore.collection("users");
      await users.add({
        "email": email,
        "user_name": name,
        "created_at": FieldValue.serverTimestamp(),
      });
      debugPrint('User profile added to Firestore for $email');
    } catch (e) {
      debugPrint('Error adding user profile to Firestore: $e');
      rethrow; // Rethrow to be caught by signUpUsingFirebase
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
