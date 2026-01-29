import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/product_models.dart';
import 'product_footer.dart';
import 'product_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
              ProductImage(product.image),
              ProductFooter(product),
            ],
          ),
        ),
      ),
    );
  }
}
