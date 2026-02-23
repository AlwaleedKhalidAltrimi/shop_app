import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/product_models.dart';

class ProductFooter extends StatelessWidget {
  final ProductModel product;

  const ProductFooter(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("\$ ${product.price}", style: AppStyles.font13boldPoppins),
          Container(
            height: 25,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.rating.rate.toString(),
                  style: AppStyles.font13boldPoppins.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(Icons.star, size: 13, color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
