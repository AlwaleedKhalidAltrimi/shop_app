import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../data/models/product_models.dart';
import '../../controllers/product_controller.dart';
import 'product_card.dart';

class CardItemsSliver extends GetView<ProductController> {
  const CardItemsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
        );
      }

      if (controller.searchList.isEmpty &&
          controller.searchTextController.text.isNotEmpty) {
        return SliverToBoxAdapter(
          child: Center(child: Image.asset(AppImages.imagesSearchEmptyLight)),
        );
      }

      final List<ProductModel> products = controller.searchList.isEmpty
          ? controller.productList
          : controller.searchList;

      return SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ProductCard(product: products[index], onTap: () {});
          }, childCount: products.length),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.8,
            mainAxisSpacing: 9,
            crossAxisSpacing: 6,
          ),
        ),
      );
    });
  }
}
