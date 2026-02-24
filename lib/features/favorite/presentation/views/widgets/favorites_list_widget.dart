import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../home/presentation/controllers/product_controller.dart';
import 'favorite_item_widget.dart';

class FavoritesListWidget extends GetView<ProductController> {
  const FavoritesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.separated(
        itemCount: controller.favouritesList.length,
        itemBuilder: (context, index) {
          final product = controller.favouritesList[index];

          return Dismissible(
            key: ValueKey(product.id),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.red,
              child: const Icon(Icons.delete, color: AppColors.white, size: 30),
            ),
            onDismissed: (direction) {
              controller.toggleFavourites(product.id);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: FavoriteItemWidget(
                key: ValueKey(product.id),
                image: product.image,
                price: product.price,
                title: product.title,
                productId: product.id,
                onToggleFavorite: () {
                  controller.toggleFavourites(product.id);
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: AppColors.grey, thickness: 1);
        },
      ),
    );
  }
}
