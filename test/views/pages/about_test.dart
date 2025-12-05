import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/pages/about_page.dart';
import 'package:union_shop/views/widgets/footer.dart';
import 'package:union_shop/views/widgets/header.dart';

void main() {
  group("about page testes", () {
    Widget createTestWidget() {
      return const MaterialApp(home: AboutPage());
    }

    Finder exactText(String s) {
      final textFinder = find.byWidgetPredicate((w) {
        if (w is Text) {
          final content = (w.data ?? (w.textSpan?.toPlainText())) ?? '';
          return content.trim() == s;
        }
        return false;
      }, description: 'Text("$s")', skipOffstage: false);
      if (textFinder.evaluate().isNotEmpty) return textFinder;

      final richFinder = find.byWidgetPredicate((w) {
        if (w is RichText) {
          final content = w.text.toPlainText();
          return content.trim() == s;
        }
        return false;
      }, description: 'RichText("$s")', skipOffstage: false);

      return richFinder;
    }

    testWidgets("should display about page content", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(exactText("About Us"), findsOneWidget);
      expect(exactText("Welcome to the Union Shop!"), findsOneWidget);
      expect(
          exactText(
              "We’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!"),
          findsOneWidget);
      expect(
          exactText(
              "All online purchases are available for delivery or instore collection!"),
          findsOneWidget);
      expect(
          exactText(
              "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net."),
          findsOneWidget);
      expect(exactText("Happy shopping!"), findsOneWidget);
      expect(exactText("The Union Shop & Reception Team"), findsOneWidget);
    });

    testWidgets("should display header and footer", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Header), findsOneWidget);
      expect(find.byType(Footer), findsOneWidget);
    });
  });
}
