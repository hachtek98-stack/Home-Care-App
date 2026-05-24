import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/screens/login_screen.dart'; // Adjust path if needed

void main() {
  testWidgets('LoginScreen toggles auth mode on TextButton tap', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify initial state (Login Mode)
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
    expect(
      find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'),
      findsOneWidget,
    );

    // Tap to toggle mode
    await tester.tap(
      find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'),
    );
    await tester.pumpAndSettle();

    // Verify toggled state (Register Mode)
    expect(
      find.widgetWithText(ElevatedButton, 'Créer un compte'),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(TextButton, 'Déjà un compte ? Se connecter'),
      findsOneWidget,
    );

    // Tap to toggle back to login mode
    await tester.tap(
      find.widgetWithText(TextButton, 'Déjà un compte ? Se connecter'),
    );
    await tester.pumpAndSettle();

    // Verify back to initial state (Login Mode)
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
    expect(
      find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'),
      findsOneWidget,
    );
  });
}
