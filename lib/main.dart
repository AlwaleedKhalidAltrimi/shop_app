import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/shop_app.dart';
import 'core/functions/check_auth_state.dart';
import 'core/functions/check_state_changes.dart';

import 'core/functions/get_storage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("Could not load .env file: \$e");
  }

  await GetStorageUtil.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkStateChanges();

  // Check if user is already logged in
  final shouldGoToHome = isUserLoggedIn();

  runApp(ShopApp(startAtHome: shouldGoToHome));
}
