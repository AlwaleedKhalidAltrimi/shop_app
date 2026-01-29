import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/functions/get_storage.dart';
import '../../../../core/functions/show_custom_toast.dart';
import '../../../../core/functions/show_error.dart';
import '../../../../core/routes/app_routes.dart';

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

  // Firebase Authentication singleton instance
  FirebaseAuth auth = FirebaseAuth.instance;

  // Google Sign In instance
  GoogleSignIn googleSignIn = GoogleSignIn();

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.toggle();
  }

  Future<void> logInUsingFirebase() async {
    debugPrint('Validating login form...');
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      try {
        debugPrint('Attempting to sign in with email: $email');
        final credential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        debugPrint('Sign in successful: ${credential.user?.uid}');

        // Store user data in GetStorage
        debugPrint('Storing user data in GetStorage');
        await GetStorageUtil.setUserData(
          userId: credential.user!.uid,
          userEmail: credential.user!.email,
          userName: credential.user!.displayName ?? email.split('@')[0],
        );
        debugPrint('User data stored successfully');

        // Successfully logged in
        if (!isClosed) {
          isLoading.value = false;
        }

        // Check if email is verified
        debugPrint(
          'Checking email verification status: ${credential.user?.emailVerified}',
        );
        if (credential.user!.emailVerified) {
          debugPrint('Email verified. Navigating to home');
          showCustomToast("Signed in successfully", type: ToastType.success);
          Get.offAllNamed(AppRoutes.main);
        } else {
          debugPrint('Email not verified. Showing toast');
          showCustomToast("Please verify your email address");
        }
      } on FirebaseAuthException catch (e) {
        debugPrint(
          'FirebaseAuthException during login: ${e.code} - ${e.message}',
        );
        _logInHandleException(e);
      } catch (e, stackTrace) {
        debugPrint("********** Unknown error during login: $e");
        debugPrint("Stack trace: $stackTrace");
        if (!isClosed) {
          isLoading.value = false;
        }
        showError("An unknown error occurred");
      }
    }
  }

  void _logInHandleException(FirebaseAuthException e) {
    debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
    if (!isClosed) {
      isLoading.value = false;
    }

    switch (e.code) {
      case 'user-not-found':
        showError("No user found for that email");
        break;
      case 'wrong-password':
        showError("Wrong password provided for that user");
        break;
      case 'invalid-email':
        showError("The email address is invalid.");
        break;
      case 'user-disabled':
        showError("The user account has been disabled.");
        break;
      case 'too-many-requests':
        showError("Too many requests. Please try again later.");
        break;
      case 'operation-not-allowed':
        showError("Email/password accounts are not enabled.");
        break;
      default:
        showError("An error occurred: ${e.message ?? 'Unknown error'}");
    }
  }

  Future<void> googleLogIn() async {
    debugPrint('Starting Google sign in process');
    isLoading.value = true;

    try {
      debugPrint('Initiating Google Sign In');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        debugPrint('Google sign in cancelled by user');
        if (!isClosed) {
          isLoading.value = false;
        }
        showCustomToast("Google sign in cancelled");
        return;
      }

      debugPrint('Google account selected: ${googleUser.email}');
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      debugPrint('Signing in to Firebase with Google credential');
      UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );
      debugPrint('Firebase sign in successful: ${userCredential.user?.uid}');

      // Check if the user is new
      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
      debugPrint('Is new user: $isNewUser');

      if (isNewUser) {
        // Add profile to Firestore for new users
        debugPrint('Adding new user profile to Firestore');
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
              "user_name": userCredential.user!.displayName ?? "No Name",
              "email": userCredential.user!.email,
              "photo_url": userCredential.user!.photoURL,
            });
        debugPrint('New user profile added to Firestore');
      }

      if (!isClosed) {
        isLoading.value = false;
      }

      // Store user data in GetStorage
      debugPrint('Storing user data in GetStorage for Google user');
      await GetStorageUtil.setUserData(
        userId: userCredential.user!.uid,
        userEmail: userCredential.user!.email,
        userName: userCredential.user!.displayName ?? "No Name",
      );
      debugPrint('User data stored successfully for Google user');

      debugPrint('Google sign in completed successfully');
      showCustomToast(
        "Signed in with Google successfully",
        type: ToastType.success,
      );
      Get.offAllNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      debugPrint(
        "Firebase Auth Error during Google sign in: ${e.code} - ${e.message}",
      );
      showError("Firebase auth error: ${e.code}");
      if (!isClosed) {
        isLoading.value = false;
      }
    } catch (e, stackTrace) {
      debugPrint("Google Login Error: $e");
      debugPrint("Stack trace: $stackTrace");
      showError("An unknown error occurred during Google sign in");
      if (!isClosed) {
        isLoading.value = false;
      }
    }
  }

  Future<void> facebookLogIn() async {
    debugPrint('Starting Facebook sign in process');
    isLoading.value = true;

    try {
      debugPrint(
        'Initiating Facebook Sign In with email and public_profile permissions',
      );
      // Trigger Facebook authentication flow
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status != LoginStatus.success) {
        debugPrint('Facebook sign in failed with status: ${result.status}');
        if (!isClosed) {
          isLoading.value = false;
        }
        showCustomToast("Facebook sign in cancelled");
        return;
      }

      debugPrint('Facebook authentication successful. Access token obtained');
      // Create Firebase credential
      final OAuthCredential facebookCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Sign in to Firebase
      debugPrint('Signing in to Firebase with Facebook credential');
      final UserCredential userCredential = await auth.signInWithCredential(
        facebookCredential,
      );
      debugPrint(
        'Firebase sign in with Facebook successful: ${userCredential.user?.uid}',
      );

      // Check if new user
      final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
      debugPrint('Is new user: $isNewUser');

      if (isNewUser) {
        debugPrint('Adding new user profile to Firestore');
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
              "user_name": userCredential.user!.displayName ?? "No Name",
              "email": userCredential.user!.email,
              "photo_url": userCredential.user!.photoURL,
              "provider": "facebook",
            });
        debugPrint('New user profile added to Firestore for Facebook user');
      }

      if (!isClosed) {
        isLoading.value = false;
      }

      // Store user data in GetStorage
      debugPrint('Storing user data in GetStorage for Facebook user');
      await GetStorageUtil.setUserData(
        userId: userCredential.user!.uid,
        userEmail: userCredential.user!.email,
        userName: userCredential.user!.displayName ?? "No Name",
      );
      debugPrint('User data stored successfully for Facebook user');

      debugPrint('Facebook sign in completed successfully');
      showCustomToast(
        "Signed in with Facebook successfully",
        type: ToastType.success,
      );
      Get.offAllNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      debugPrint("Facebook Firebase Auth Error: ${e.code} - ${e.message}");
      showError("Firebase auth error: ${e.code}");
      if (!isClosed) {
        isLoading.value = false;
      }
    } catch (e, stackTrace) {
      debugPrint("Facebook Login Error: $e");
      debugPrint("Stack trace: $stackTrace");
      showError("An unknown error occurred during Facebook sign in");
      if (!isClosed) {
        isLoading.value = false;
      }
    }
  }

  Future<void> signOutFromApp() async {
    debugPrint('Starting sign out process');
    isLoading.value = true;

    try {
      // Sign out from Firebase
      debugPrint('Signing out from Firebase Auth');
      await auth.signOut();

      // Sign out from Google if signed in
      if (await googleSignIn.isSignedIn()) {
        debugPrint('User signed in to Google. Signing out from Google');
        await googleSignIn.signOut();
      } else {
        debugPrint('User not signed in to Google');
      }

      // Sign out from Facebook if signed in
      debugPrint('Signing out from Facebook Auth');
      await FacebookAuth.instance.logOut();

      // Clear stored data in GetStorage
      debugPrint('Clearing user data from GetStorage');
      await GetStorageUtil.clearUserData();

      // Reset loading state
      if (!isClosed) {
        isLoading.value = false;
      }

      // Navigate to welcome screen
      debugPrint('Sign out successful. Navigating to welcome screen');
      Get.offAllNamed(AppRoutes.welcome);

      showCustomToast("Successfully signed out", type: ToastType.success);
    } catch (e, stackTrace) {
      debugPrint("Sign out error: $e");
      debugPrint("Stack trace: $stackTrace");
      if (!isClosed) {
        isLoading.value = false;
      }
      showError("Error occurred while signing out");
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
