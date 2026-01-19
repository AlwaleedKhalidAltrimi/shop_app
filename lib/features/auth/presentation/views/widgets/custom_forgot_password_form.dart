import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/helper/validators.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../controllers/forgot_password_controller.dart';
import 'custom_auth_text_from_field.dart';
import 'custom_prefix_icon_widget.dart';

class CustomForgotPasswrodForm extends GetWidget<ForgotPasswordController> {
  const CustomForgotPasswrodForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        child: Column(
          children: [
            // Email field
            CustomAuthTextFromField(
              controller: controller.emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: CustomPrefixIcon(imageName: AppImages.imagesEmail),
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? CircularProgressIndicator(color: AppColors.white)
                  : CustomButton(
                      onPressed: () async {
                        await controller.resetPassword();
                      },
                      text: "SEND",
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
