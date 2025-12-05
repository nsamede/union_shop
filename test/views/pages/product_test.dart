import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/pages/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return MaterialApp(home: ProductPage());
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(
        find.text('Classic Sweatshirts'),
        findsOneWidget,
      );
      expect(find.text('£23.00'), findsOneWidget);
      expect(
          find.text(
              'Bringing to you, our best selling Classic Sweatshirt. Available in 4 different colours.'),
          findsOneWidget);
      expect(find.text('Soft, comfortable, 50% cotton and 50% polyester.'),
          findsOneWidget);
    });

    testWidgets('should display student instruction text', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that student instruction is present
      expect(
        find.text(
          'Students should add size options, colour options, quantity selector, add to cart button, and buy now button here.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that footer is present
      expect(find.text('Placeholder Footer'), findsOneWidget);
      expect(
        find.text('Students should customise this footer section'),
        findsOneWidget,
      );
    });
  });
}
