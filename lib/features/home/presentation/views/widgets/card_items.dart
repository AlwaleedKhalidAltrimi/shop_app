// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shop_app/core/utils/app_colors.dart';
// import '../../../../../core/utils/app_images.dart';
// import '../../../../../core/utils/app_styles.dart';
// import '../../../data/models/product_models.dart';
// import '../../controllers/product_controller.dart';

// class CardItems extends GetView<ProductController> {
//   const CardItems({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(color: AppColors.primaryColor),
//         );
//       } else {
//         return Expanded(
//           child:
//               controller.searchList.isEmpty &&
//                   controller.searchTextController.text.isNotEmpty
//               ? Get.isDarkMode
//                     ? Image.asset(AppImages.imagesSearchEmptyDark)
//                     : Image.asset(AppImages.imagesSearchEmptyLight)
//               : GridView.builder(
//                   itemCount: controller.searchList.isEmpty
//                       ? controller.productList.length
//                       : controller.searchList.length,
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     childAspectRatio: 0.8,
//                     mainAxisSpacing: 9.0,
//                     crossAxisSpacing: 6.0,
//                     maxCrossAxisExtent: 200,
//                   ),
//                   itemBuilder: (context, index) {
//                     if (controller.searchList.isEmpty) {
//                       return buildCardItems(
//                         image: controller.productList[index].image,
//                         price: controller.productList[index].price,
//                         rate: controller.productList[index].rating.rate,
//                         productId: controller.productList[index].id,
//                         productModels: controller.productList[index],
//                         onTap: () {},
//                       );
//                     } else {
//                       return buildCardItems(
//                         image: controller.searchList[index].image,
//                         price: controller.searchList[index].price,
//                         rate: controller.searchList[index].rating.rate,
//                         productId: controller.searchList[index].id,
//                         productModels: controller.searchList[index],
//                         onTap: () {},
//                       );
//                     }
//                   },
//                 ),
//         );
//       }
//     });
//   }

//   Widget buildCardItems({
//     required String image,
//     required double price,
//     required double rate,
//     required int productId,
//     required ProductModel productModels,
//     required Function() onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(5),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: AppColors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: AppColors.grey.withValues(alpha: 0.2),
//                 spreadRadius: 3.0,
//                 blurRadius: 5.0,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               Obx(
//                 () => Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         controller.manageFavourites(productId);
//                       },
//                       icon: controller.isFavourites(productId)
//                           ? const Icon(Icons.favorite, color: AppColors.red)
//                           : const Icon(
//                               Icons.favorite_outline,
//                               color: AppColors.black,
//                             ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.shopping_cart,
//                         color: AppColors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 140,
//                 decoration: BoxDecoration(
//                   color: AppColors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Image.network(image, fit: BoxFit.fitHeight),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("\$ $price", style: AppStyles.font13boldPoppins),
//                     Container(
//                       height: 20,
//                       width: 45,
//                       decoration: BoxDecoration(
//                         color: AppColors.primaryColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 3, right: 2),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "$rate",
//                               style: const TextStyle(
//                                 color: AppColors.white,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const Icon(
//                               Icons.star,
//                               size: 13,
//                               color: AppColors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../data/models/product_models.dart';
import '../../controllers/product_controller.dart';
import 'product_card.dart';

class CardItems extends GetView<ProductController> {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.primaryColor),
        );
      }

      if (controller.searchList.isEmpty &&
          controller.searchTextController.text.isNotEmpty) {
        return Center(
          child: Image.asset(
            Get.isDarkMode
                ? AppImages.imagesSearchEmptyDark
                : AppImages.imagesSearchEmptyLight,
          ),
        );
      }

      final List<ProductModel> products = controller.searchList.isEmpty
          ? controller.productList
          : controller.searchList;

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.8,
          mainAxisSpacing: 9,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index], onTap: () {});
        },
      );
    });
  }
}
