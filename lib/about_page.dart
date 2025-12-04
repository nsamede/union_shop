import 'package:flutter/material.dart';
import 'package:union_shop/app_drawer.dart';
import 'package:union_shop/app_styles.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/header.dart';
import 'package:union_shop/top_banner.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBanner(),
          const Header(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                "About Us",
                style: heading1,
              ),
            ),
          ),
          // Main text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome to the Union Shop!",
                  style: bodyText,
                ),
                const Text(""),
                RichText(
                    text: const TextSpan(
                        text:
                            "We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive ",
                        style: bodyText,
                        children: [
                      TextSpan(
                          text: "personalisation service!",
                          style: bodyTextUnderlined)
                    ])),
                const Text(""),
                const Text(
                    "All online purchases are available for delivery or instore collection!",
                    style: bodyText),
                const Text(""),
                const Text(
                  "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.",
                  style: bodyText,
                ),
                const Text(""),
                const Text(
                  "Happy shopping!",
                  style: bodyText,
                ),
                const Text(
                  "The Union Shop & Reception Team",
                  style: bodyText,
                ),
              ],
            ),
          ),
          const Footer(),
        ],
      )),
    );
  }
}
