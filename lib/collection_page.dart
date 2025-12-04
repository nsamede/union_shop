import 'package:flutter/material.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/top_banner.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

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
            )
          ],
        ),
      ),
    );
  }
}
