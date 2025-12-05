import 'package:flutter/material.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/home_screen.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/sign_in_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => ProductPage(),
        '/about': (context) => const AboutPage(),
        '/collections': (context) => const CollectionsPage(),
        '/collection': (context) => const CollectionPage(),
        '/sale': (context) => CollectionPage(
              title: "SALE",
              description:
                  "Don't miss out! Get yours before they're all gone!. All prices shown are inclusive of the discount.",
              products: List<Product>.generate(10, (index) {
                final types = <ProductType>[];
                if (index % 2 == 0) types.add(ProductType.merchandise);
                if (index % 3 == 0) types.add(ProductType.clothing);
                if (index % 5 == 0) types.add(ProductType.popular);
                return Product(
                  title: 'Product ${index + 1}',
                  price: 20.0 + index,
                  salePrice: 15.0 + index,
                  imageUrl: 'images/portsmouthCityMagnet1.jpg',
                  productTypes: types,
                );
              }),
            ),
        '/signin': (context) => const SignInPage(),
      },
    );
  }
}
