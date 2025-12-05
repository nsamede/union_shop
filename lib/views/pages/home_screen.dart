import 'package:flutter/material.dart';
import 'package:union_shop/views/widgets/app_drawer.dart';
import 'package:union_shop/views/app_styles.dart';
import 'package:union_shop/views/widgets/collection_card.dart';
import 'package:union_shop/views/widgets/collection_preview.dart';
import 'package:union_shop/views/widgets/footer.dart';
import 'package:union_shop/views/widgets/header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/navigation_functions.dart';
import 'package:union_shop/views/widgets/top_banner.dart';

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
                            'assets/images/portsmouthCityPostcard2.jpg',
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
