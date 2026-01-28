// import '../utils/app_colors.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// showCustomToast(String msg) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: AppColors.white,
//     textColor: AppColors.primaryColor,
//     fontSize: 16.0,
//   );
// }

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/app_colors.dart';

enum ToastType { success, error, info }

void showCustomToast(String msg, {ToastType type = ToastType.info}) {
  Color textColor;

  // فقط تحديد لون النص حسب نوع الرسالة
  switch (type) {
    case ToastType.success:
      textColor = AppColors.primaryColor;
      break;
    case ToastType.error:
      textColor = AppColors.red;
      break;
    case ToastType.info:
      textColor = AppColors.black;
      break;
  }

  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.white, // ثابت لكل الحالات
    textColor: textColor,
    fontSize: 16.0,
  );
}
