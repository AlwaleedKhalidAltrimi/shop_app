import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_images.dart';
import '../../../../../core/helper/validators.dart';
import '../../../../../core/utils/app_colors.dart';
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
      key: controller.formKey,
      child: Column(
        children: [
          // Name field
          CustomAuthTextFromField(
            controller: controller.nameController,
            hintText: 'User Name',
            prefixIcon: CustomPrefixIcon(imageName: AppImages.imagesUser),
            validator: Validators.validateName,
          ),
          const SizedBox(height: 20),

          // Email field
          CustomAuthTextFromField(
            controller: controller.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: CustomPrefixIcon(imageName: AppImages.imagesEmail),
            validator: Validators.validateEmail,
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
                  validator: Validators.validatePassword,
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
