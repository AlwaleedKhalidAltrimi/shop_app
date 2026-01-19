import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomAuthText extends StatelessWidget {
  final String promptText, linkText;

  const CustomAuthText({
    super.key,
    required this.promptText,
    required this.linkText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: promptText, style: AppStyles.font30boldOleoScript),
            const WidgetSpan(child: SizedBox(width: 3)),
            TextSpan(
              text: linkText,
              style: AppStyles.font30boldOleoScript.copyWith(
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
