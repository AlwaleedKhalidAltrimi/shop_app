import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class ForgotPasswordTitle extends StatelessWidget {
  const ForgotPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return
    //  Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 34.0),
    Text(
      'If you want to recover your account, then please provide your email ID below..',
      textAlign: TextAlign.center,
      style: AppStyles.font14mediumPoppins.copyWith(height: 2),
    );
  }
}
