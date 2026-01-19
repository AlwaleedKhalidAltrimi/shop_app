import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_images.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../controllers/login_controller.dart';
import 'custom_auth_text_from_field.dart';
import 'custom_prefix_icon_widget.dart';
import 'forgot_password_text_widget.dart';

class CustomLoginForm extends GetWidget<LoginController> {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: controller.formKey,
      child: Column(
        children: [
          // Email field
          CustomAuthTextFromField(
            controller: controller.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: CustomPrefixIcon(imageName: AppImages.imagesEmail),
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return 'Invalid email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),

          // Password field
          Obx(
            () => Column(
              children: [
                // Password field
                CustomAuthTextFromField(
                  controller: controller.passwordController,
                  hintText: 'Password',
                  keyboardType: TextInputType.number,
                  obscureText: controller.isPasswordHidden.value,
                  prefixIcon: CustomPrefixIcon(imageName: AppImages.imagesLock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.black,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  validator: (value) {
                    if (value.toString().length < 6) {
                      return 'Password should be longer or equal to 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                const ForgotPasswordTextWidget(),
                const SizedBox(height: 70),

                controller.isLoading.value
                    ? CircularProgressIndicator(color: AppColors.white)
                    : CustomButton(
                        text: "LOG IN",
                        onPressed: controller.signInUsingFirebase,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
