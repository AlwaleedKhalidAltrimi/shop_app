import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  const EmptyFavoritesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(AppImages.imagesHeart),
          ),
          const SizedBox(height: 20),
          Text(
            'Please, Add your favorites products.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
