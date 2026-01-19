import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.greyShade200, thickness: 2);
  }
}
