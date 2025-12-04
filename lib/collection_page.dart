import 'package:flutter/material.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/top_banner.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopBanner(),
            Header(),
          ],
        ),
      ),
    );
  }
}
