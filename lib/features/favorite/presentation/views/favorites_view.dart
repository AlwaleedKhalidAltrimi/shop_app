import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/presentation/controllers/product_controller.dart';
import 'widgets/empty_favorites_widget.dart';
import 'widgets/favorites_list_widget.dart';

class FavoritesView extends GetView<ProductController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.favouritesList.isEmpty) {
          return const EmptyFavoritesWidget();
        } else {
          return const FavoritesListWidget();
        }
      }),
    );
  }
}
