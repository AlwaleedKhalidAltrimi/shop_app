import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomAuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final TextInputType keyboardType;

  const CustomAuthTextFromField({
    super.key,
    required this.controller,
    required this.validator,
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
      style: const TextStyle(color: AppColors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.greyShade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: AppStyles.font16mediumPoppins,
        enabledBorder: _border(),
        focusedBorder: _border(),
        errorBorder: _border(color: AppColors.red),
        focusedErrorBorder: _border(color: AppColors.red),
      ),
    );
  }

  OutlineInputBorder _border({Color color = AppColors.white}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color),
    );
  }
}
