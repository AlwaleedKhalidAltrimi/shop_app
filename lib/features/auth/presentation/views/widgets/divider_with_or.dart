import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import 'custom_divider.dart';

class DividerWithOr extends StatelessWidget {
  const DividerWithOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Customdivider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('OR', style: AppStyles.font16regularPoppins),
        ),
        Expanded(child: Customdivider()),
      ],
    );
  }
}
