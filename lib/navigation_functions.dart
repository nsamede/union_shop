import 'package:flutter/material.dart';

void navigateToProduct(BuildContext context) {
  Navigator.pushNamed(context, '/product');
}

void navigateToAbout(BuildContext context) {
  Navigator.pushNamed(context, '/about');
}

void navigateToHome(BuildContext context) {
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}

void navigateToCollection(BuildContext context) {
  Navigator.pushNamed(context, "/collection");
}

void navigateToSale(BuildContext context) {
  Navigator.pushNamed(context, "/sale");
}

void navigateToSignIn(BuildContext context) {
  Navigator.pushNamed(context, "/signin");
}
