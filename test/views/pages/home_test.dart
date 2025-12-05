import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/views/widgets/footer.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('Essential Range - Over 20% OFF!'), findsOneWidget);
      expect(
          find.text(
              'Over 20% off our Essential Range. Come and grab yours while stock lasts!'),
          findsOneWidget);
      expect(find.text('BROWSE PRODUCTS'), findsOneWidget);

      expect(find.text('SIGNATURE RANGE'), findsOneWidget);
      expect(find.text('PORTSMOUTH CITY COLLECTION'), findsOneWidget);
      expect(find.text('VIEW ALL'), findsOneWidget);
    });

    testWidgets('should display product cards', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that product cards are displayed
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
      expect(find.text('Product 3'), findsOneWidget);
      expect(find.text('Product 4'), findsOneWidget);
      expect(find.text('Product 5'), findsOneWidget);
      expect(find.text('Product 6'), findsOneWidget);
      expect(find.text('Product 7'), findsOneWidget);

      // Check prices are displayed
      expect(find.textContaining('£20'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);

      expect(find.textContaining('£10'), findsOneWidget);
      expect(find.text('£6.99'), findsOneWidget);

      expect(find.textContaining('£15'), findsOneWidget);
      expect(find.textContaining('£12'), findsOneWidget);

      expect(find.text('£1.0'), findsOneWidget);
      expect(find.text('£3.0'), findsOneWidget);
      expect(find.text('£7.0'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that footer is present
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
