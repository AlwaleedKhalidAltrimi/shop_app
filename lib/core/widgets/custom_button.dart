import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double height;
  final double borderRadius;
  final EdgeInsets padding;
  const CustomButton({
    super.key,
    this.color,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.height = 56,
    this.borderRadius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 56,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        child: Text(text, style: textStyle ?? AppStyles.font19boldPoppins),
      ),
    );
  }
}
