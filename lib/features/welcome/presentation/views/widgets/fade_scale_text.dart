import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class FadeScaleText extends StatelessWidget {
  const FadeScaleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Welcome\nto our shopping app!',
      textAlign: TextAlign.center,
      style: AppStyles.font30semiBoldGravitasOne.copyWith(height: 1.5),
    );
  }
}
