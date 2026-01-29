import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class ProductImage extends StatelessWidget {
  final String image;

  const ProductImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Image.network(
        image,
        fit: BoxFit.fitHeight,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
              strokeWidth: 2,
            ),
          );
        },
        errorBuilder: (_, __, ___) {
          return const Icon(Icons.image_not_supported);
        },
      ),
    );
  }
}
