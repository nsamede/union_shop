import 'package:flutter/material.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/top_banner.dart';

class ProductPage extends StatelessWidget {
  final Product product = Product(
      title: "Example Product",
      price: 23.00,
      imageUrl: 'images/greenSweatshirtFinal_900x.png',
      productTypes: []);

  ProductPage({super.key});

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopBanner(),
            const Header(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: heading1,
                        ),
                        Text(
                          "£${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Text("Tax included.",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[700])),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        DropdownMenu<String>(
                          label: Text("Colour"),
                          initialSelection: "Black",
                          expandedInsets: EdgeInsets.zero,
                          requestFocusOnTap: false,
                          dropdownMenuEntries: [
                            DropdownMenuEntry(value: "Black", label: "Black"),
                            DropdownMenuEntry(value: "Purple", label: "Purple"),
                            DropdownMenuEntry(value: "Grey", label: "Grey"),
                            DropdownMenuEntry(
                                value: "Bottle Green", label: "Bottle Green"),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownMenu<String>(
                                label: Text("Size"),
                                initialSelection: "S",
                                expandedInsets: EdgeInsets.zero,
                                requestFocusOnTap: false,
                                dropdownMenuEntries: [
                                  DropdownMenuEntry(value: "S", label: "S"),
                                  DropdownMenuEntry(value: "M", label: "M"),
                                  DropdownMenuEntry(value: "L", label: "L"),
                                  DropdownMenuEntry(value: "XL", label: "XL"),
                                  DropdownMenuEntry(value: "XXL", label: "XXL"),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: 100,
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Quantity"),
                                      hint: Text("1",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14)),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
