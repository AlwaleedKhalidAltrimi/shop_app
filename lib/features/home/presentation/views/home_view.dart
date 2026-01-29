import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';
import 'widgets/card_items.dart';
import 'widgets/search_text_form.dart';
import '../controllers/product_controller.dart';

class HomeView extends GetView<ProductController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Find Your", style: AppStyles.font25boldPoppins),
                      const SizedBox(height: 5),
                      Text("INSPIRATION", style: AppStyles.font28boldPoppins),
                      const SizedBox(height: 20),
                      SearchFormText(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: AppStyles.font20mediumPoppins,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CardItems(),
            ],
          ),
        ),
      ),
    );
  }
}
