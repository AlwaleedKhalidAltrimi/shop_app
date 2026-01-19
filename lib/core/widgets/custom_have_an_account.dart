import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../utils/app_colors.dart';

class CustomHaveAnAccount extends StatelessWidget {
  final String promptText, linkText;
  final VoidCallback onTap;
  final TextStyle? promptStyle, linkStyle;

  const CustomHaveAnAccount({
    super.key,
    required this.promptText,
    required this.linkText,
    required this.onTap,
    this.promptStyle,
    this.linkStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: promptText,
              style:
                  promptStyle ??
                  AppStyles.font16regularPoppins.copyWith(
                    color: AppColors.white70,
                  ),
            ),
            const WidgetSpan(child: SizedBox(width: 6)),
            TextSpan(
              text: linkText,
              style:
                  linkStyle ??
                  AppStyles.font16regularPoppins.copyWith(
                    color: AppColors.white,
                  ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
