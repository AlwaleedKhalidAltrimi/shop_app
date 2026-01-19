import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_images.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../controllers/signup_controller.dart';
import 'custom_auth_text_from_field.dart';
import 'custom_prefix_icon_widget.dart';
import 'terms_and_condition_widget.dart';

class CustomSignUpForm extends GetWidget<SignupController> {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Name field
          CustomAuthTextFromField(
            controller: controller.nameController,
            hintText: 'User Name',
            prefixIcon: Image.asset(AppImages.imagesUser),
            validator: (value) {
              if (value.toString().length <= 2 ||
                  !RegExp(validationName).hasMatch(value)) {
                return 'Enter valid name';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),

          // Email field
          CustomAuthTextFromField(
            controller: controller.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Image.asset(AppImages.imagesEmail),
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

                // Terms and conditions section
                TermsAndConditionWidget(),

                const SizedBox(height: 70),

                controller.isLoading.value
                    ? CircularProgressIndicator(color: AppColors.white)
                    : CustomButton(
                        color: controller.termsAccepted.value
                            ? null
                            : AppColors.greyShade200,
                        text: "SIGN UP",
                        textStyle: (controller.termsAccepted.value
                            ? AppStyles.font19boldPoppins
                            : AppStyles.font19boldPoppins.copyWith(
                                color: AppColors.black45,
                              )),
                        onPressed: controller.signUpUsingFirebase,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
