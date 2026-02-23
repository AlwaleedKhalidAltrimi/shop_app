import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../controllers/product_controller.dart';

class SearchText extends GetView<ProductController> {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextField(
        controller: controller.searchTextController,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.black,
        style: AppStyles.font16mediumPoppins,
        onChanged: controller.searchProduct,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: "Search with name & price",
          hintStyle: AppStyles.font16mediumPoppins,
          prefixIcon: Icon(Icons.search, color: AppColors.grey),
          suffixIcon: controller.searchText.value.isNotEmpty
              ? IconButton(
                  onPressed: controller.clearSearchField,
                  icon: const Icon(Icons.close, color: AppColors.black),
                )
              : null,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border,
          focusedErrorBorder: _border,
        ),
      );
    });
  }

  static final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.white, width: 1),
  );
}
