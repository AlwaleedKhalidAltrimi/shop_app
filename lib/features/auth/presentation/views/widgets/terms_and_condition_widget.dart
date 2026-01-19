import '../../../../../../core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'custom_check_box.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "I accept ",
                style: AppStyles.font16regularPoppins,
              ),
              TextSpan(
                text: "terms & conditions",
                style: AppStyles.font16regularPoppins.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
