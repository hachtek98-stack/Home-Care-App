import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/screens/login_screen.dart';

void main() {
  testWidgets('LoginScreen renders correctly and toggles state', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify initial state (Login).
    expect(find.text('Home Care'), findsOneWidget);
    expect(find.text('Service BioHome'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
    expect(
      find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'),
      findsOneWidget,
    );

    // Tap the toggle button to switch to Register state.
    await tester.tap(
      find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'),
    );
    await tester.pumpAndSettle(); // Wait for animations/rebuilds

    // Verify toggled state (Register).
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
