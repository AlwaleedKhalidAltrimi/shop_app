import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { success, error, warning }

void showCustomSnackBar({
  required String title,
  required String message,
  SnackType type = SnackType.success,
}) {
  if (Get.isSnackbarOpen) {
    Get.closeCurrentSnackbar();
  }
  Color backgroundColor;
  IconData icon;

  switch (type) {
    case SnackType.success:
      backgroundColor = Colors.green;
      icon = Icons.check_circle;
      break;
    case SnackType.error:
      backgroundColor = Colors.red;
      icon = Icons.error;
      break;
    case SnackType.warning:
      backgroundColor = Colors.orange;
      icon = Icons.warning;
      break;
  }

  Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(12),
      borderRadius: 12,
      icon: Icon(icon, color: Colors.white),
      duration: const Duration(seconds: 3),
      isDismissible: true,
      dismissDirection: DismissDirection.startToEnd,
    ),
  );
}
