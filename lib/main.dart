import 'package:flutter/material.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/collection_card.dart';
import 'package:union_shop/collection_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/navigation_functions.dart';
import 'package:union_shop/product_card.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/sign_in_page.dart';
import 'package:union_shop/top_banner.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBanner(),
            // Header
            const Header(),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/portsmouthCityPostcard2.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Essential Range - Over 20% OFF!',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Over 20% off our Essential Range. Come and grab yours while stock lasts!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () => navigateToSale(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            CollectionPreview(
              title: "ESSENTIAL RANGE - OVER 20% OFF!",
              products: [
                Product(
                    imageUrl: "images/greenSweatshirtFinal_900x.png",
                    title: "Product 1",
                    price: 20.00,
                    productTypes: [],
                    salePrice: 14.99),
                Product(
                    imageUrl: "images/greenSweatshirtFinal_900x.png",
                    title: "Product 2",
                    price: 10.00,
                    productTypes: [],
                    salePrice: 6.99),
              ],
            ),
            CollectionPreview(title: "SIGNATURE RANGE", products: [
              Product(
                  imageUrl: "images/greenSweatshirtFinal_900x.png",
                  title: "Product 3",
                  price: 15.00,
                  productTypes: []),
              Product(
                  imageUrl: "images/greenSweatshirtFinal_900x.png",
                  title: "Product 4",
                  price: 12.00,
                  productTypes: []),
            ]),
            CollectionPreview(
              title: "PORTSMOUTH CITY COLLECTION",
              products: [
                Product(
                    imageUrl: "images/portsmouthCityMagnet1.jpg",
                    title: "Product 5",
                    price: 1.00,
                    productTypes: []),
                Product(
                    imageUrl: "images/portsmouthCityMagnet1.jpg",
                    title: "Product 6",
                    price: 3.00,
                    productTypes: []),
                Product(
                    imageUrl: "images/portsmouthCityMagnet1.jpg",
                    title: "Product 7",
                    price: 7.00,
                    productTypes: []),
              ],
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff4d2963),
                    foregroundColor: Colors.white,
                    shape: const ContinuousRectangleBorder(),
                  ),
                  onPressed: () => navigateToCollections(context),
                  child: const Text(
                    "VIEW ALL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  )),
            ),

            const SizedBox(height: 40),
            const Text(
              "Our Range",
              style: heading2,
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  for (int i = 0; i < 4; i++)
                    GestureDetector(
                      onTap: () => navigateToCollection(context),
                      child: CollectionCard(
                          imageUrl: "images/greenSweatshirtFinal_900x.png",
                          title: "Collection $i"),
                    )
                ],
              ),
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }
}

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
