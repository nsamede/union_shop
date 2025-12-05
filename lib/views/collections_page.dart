import 'package:flutter/material.dart';
import 'package:union_shop/views/widgets/app_drawer.dart';
import 'package:union_shop/views/app_styles.dart';
import 'package:union_shop/views/widgets/collection_card.dart';
import 'package:union_shop/views/widgets/footer.dart';
import 'package:union_shop/views/widgets/header.dart';
import 'package:union_shop/views/widgets/top_banner.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBanner(),
              const Header(),
              const Text(
                "Collections",
                style: heading1,
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var i = 0; i < 10; i++)
                      const CollectionCard(
                        title: 'Placeholder',
                        imageUrl: 'images/greenSweatshirtFinal_900x.png',
                      )
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ));
  }
}
