import 'package:flutter/material.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_card.dart';
import 'package:union_shop/top_banner.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final List<Product> _products = List.generate(10, (index) {
    final types = <ProductType>[];
    if (index % 2 == 0) types.add(ProductType.merchandise);
    if (index % 3 == 0) types.add(ProductType.clothing);
    if (index % 5 == 0) types.add(ProductType.popular);
    return Product(
        title: 'Product $index',
        price: 10.0 + index,
        imageUrl: 'images/portsmouthCityMagnet1.jpg',
        productTypes: types);
  });
  List<Product> _displayedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBanner(),
            const Header(),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text(
                      "Example Collection",
                      style: heading1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    "This is a subheading for an example collection, describing what the collection is.",
                    style: TextStyle(
                        color: Colors.black54, letterSpacing: 1, fontSize: 15),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              shrinkWrap: true,
              children: [
                for (var product in _products)
                  Expanded(
                      child: ProductCard(
                    product: product,
                  ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
