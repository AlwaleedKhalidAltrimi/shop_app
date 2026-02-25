import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import 'widgets/card_items_sliver.dart';
import 'widgets/search_text.dart';
import '../controllers/product_controller.dart';
import 'widgets/category_selector.dart';

class HomeView extends GetView<ProductController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Find Your", style: AppStyles.font25boldPoppins),
                      const SizedBox(height: 5),
                      Text("INSPIRATION", style: AppStyles.font28boldPoppins),
                      const SizedBox(height: 10),
                      const SearchText(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Obx(() {
                        // Add "All Categories" option to the list
                        List<String> categoriesWithAll = [
                          'All Categories',
                          ...controller.categoriesList,
                        ];

                        return CategorySelector(
                          selectedCategory:
                              controller.selectedCategory.value.isEmpty
                              ? 'All Categories'
                              : controller.selectedCategory.value,
                          categories: categoriesWithAll,
                          onChanged: (value) async {
                            if (value != null) {
                              // Filter products by category
                              if (value == 'All Categories') {
                                controller.filterProductsByCategory('');
                              } else {
                                controller.filterProductsByCategory(value);
                              }
                            }
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const CardItemsSliver(),
          ],
        ),
      ),
    );
  }
}
