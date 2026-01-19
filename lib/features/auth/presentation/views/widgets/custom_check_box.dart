import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/signup_controller.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends GetWidget<SignupController> {
  const CustomCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Transform.scale(
        scale: 1.3,
        child: Checkbox(
          value: controller.termsAccepted.value,
          activeColor: AppColors.primaryColor,
          fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.greyShade200;
          }),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          side: BorderSide(color: AppColors.greyShade200),
          onChanged: controller.toggleTermsAccepted,
        ),
      ),
    );
  }
}
