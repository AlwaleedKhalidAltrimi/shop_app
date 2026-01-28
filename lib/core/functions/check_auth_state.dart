import 'package:firebase_auth/firebase_auth.dart';
import 'get_storage.dart';

/// Checks if the user is currently authenticated and logged in
/// Returns true if user is logged in, false otherwise
bool isUserLoggedIn() {
  final user = FirebaseAuth.instance.currentUser;
  final isLoggedIn = GetStorageUtil.isLoggedIn();
  return user != null && isLoggedIn;
}
