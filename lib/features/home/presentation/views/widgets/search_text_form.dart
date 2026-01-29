// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_styles.dart';
// import '../../controllers/product_controller.dart';

// class SearchFormText extends GetView<ProductController> {
//   const SearchFormText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductController>(
//       builder: (_) => TextField(
//         controller: controller.searchTextController,
//         cursorColor: Colors.black,
//         keyboardType: TextInputType.text,
//         onChanged: (searchName) {
//           controller.addSearchToList(searchName);
//         },
//         decoration: InputDecoration(
//           fillColor: AppColors.white,
//           focusColor: AppColors.red,
//           prefixIcon: Icon(Icons.search, color: AppColors.grey),
//           suffixIcon: controller.searchTextController.text.isNotEmpty
//               ? IconButton(
//                   onPressed: () {
//                     controller.clearSearch();
//                   },
//                   icon: const Icon(Icons.close, color: AppColors.black),
//                 )
//               : null,
//           hintText: "Search with name & price",
//           hintStyle: AppStyles.font16mediumPoppins,
//           filled: true,
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.white),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../controllers/product_controller.dart';

class SearchFormText extends StatelessWidget {
  const SearchFormText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return TextField(
          controller: controller.searchTextController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.black,
          style: AppStyles.font16mediumPoppins,
          onChanged: controller.addSearchToList,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            hintText: "Search with name & price",
            hintStyle: AppStyles.font16mediumPoppins,
            prefixIcon: Icon(Icons.search, color: AppColors.grey),
            suffixIcon: controller.searchTextController.text.isNotEmpty
                ? IconButton(
                    onPressed: controller.clearSearch,
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
      },
    );
  }

  static final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: AppColors.white, width: 1),
  );
}
