import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routes/app_pages.dart';
import '../core/routes/app_routes.dart';

class ShopApp extends StatelessWidget {
  final bool startAtHome;

  const ShopApp({super.key, this.startAtHome = false});

  String _getInitialRoute() {
    // If startAtHome is true, go to home
    if (startAtHome) {
      return AppRoutes.main;
    }
    // Otherwise, show welcome screen
    return AppRoutes.welcome;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      initialRoute: _getInitialRoute(),
      getPages: AppPages.getPages,
    );
  }
}
