import 'package:flutter/material.dart';

class CollectionPage extends StatelessWidget {
  final String title;

  const CollectionPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
