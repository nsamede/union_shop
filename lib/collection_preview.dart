import 'package:flutter/material.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_card.dart';

class CollectionPreview extends StatelessWidget {
  final String? title;
  final List<Product>? products;

  const CollectionPreview({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              title!,
              style: heading2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              children: [
                for (Product product in products!)
                  ProductCard(
                    product: product,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
