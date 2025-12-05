import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/views/pages/sign_in_page.dart';

void main() {
  group("sign in page tests", () {
    Widget createTestWidget() {
      return const MaterialApp(home: SignInPage());
    }

    testWidgets("should display UPSU logo", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets("should display sign in text", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text("Sign in"), findsOneWidget);
      expect(find.text("Choose how you'd like to sign in"), findsOneWidget);
    });

    testWidgets("buttons display correctly", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(TextButton), findsNWidgets(2));
      expect(find.text("Sign in with"), findsOneWidget);
      expect(find.text("Continue"), findsOneWidget);
    });

    testWidgets("email field is functional", (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final emailField = find.byType(TextField).first;
      expect(emailField, findsOneWidget);

      await tester.enterText(emailField, "test@example.com");
      expect(find.text("test@example.com"), findsOneWidget);
    });
  });
}
