import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/pages/product_page.dart';
import 'package:union_shop/views/widgets/footer.dart';
import 'package:union_shop/views/widgets/header.dart';

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

    testWidgets('should display header', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byType(Header), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
