import 'package:flutter/material.dart';
import 'package:union_shop/navigation_functions.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const ListTile(
              title: Text(
            "Home",
          )),
          const ExpansionTile(
            title: Text(
              "Shop",
            ),
            children: [
              Text(
                "Clothing",
              ),
              Text(
                "Merchandise",
              ),
              Text(
                "Halloween 🎃",
              ),
              Text(
                "Signature & Essential Range",
              ),
              Text(
                "Portsmouth City Collection",
              ),
              Text(
                "Pride Collection 🏳️‍🌈",
              ),
              Text(
                "Graduation 🎓",
              )
            ],
          ),
          const ListTile(
              title: Text(
            "The Print Shack",
          )),
          const ListTile(
              title: Text(
            "SALE!",
          )),
          GestureDetector(
            child: const ListTile(
              title: Text(
                "About",
              ),
            ),
            onTap: () => navigateToAbout(context),
          ),
          const ListTile(
              title: Text(
            "UPSU.net",
          )),
        ],
      ),
    );
  }
}
