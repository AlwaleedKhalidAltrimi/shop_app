import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/utils/app_styles.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.forgotPassword);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text("Forgot Password?", style: AppStyles.font14regularPoppins),
      ),
    );
  }
}
