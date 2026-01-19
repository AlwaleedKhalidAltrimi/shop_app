import 'package:flutter/material.dart';
import 'package:shop_app/core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_have_an_account.dart';

class ContainerUnderWidgets extends StatelessWidget {
  final String promptText, linkText;
  final VoidCallback onTap;

  const ContainerUnderWidgets({
    super.key,
    required this.promptText,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: CustomHaveAnAccount(
        promptText: promptText,
        linkText: linkText,
        onTap: onTap,
        promptStyle: AppStyles.font18regularPoppins.copyWith(
          color: AppColors.white70,
        ),
        linkStyle: AppStyles.font18regularPoppins.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
