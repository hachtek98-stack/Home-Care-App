import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/screens/login_screen.dart';

void main() {
  testWidgets('Toggle between login and register states', (WidgetTester tester) async {
    // Build the LoginScreen
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Initial state: Login
    // Main button should be "Se connecter"
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
    // Toggle button should be "Pas encore de compte ? Créer un compte"
    expect(find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'), findsOneWidget);

    // Tap toggle button to switch to Register
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    // Register state
    // Main button should be "Créer un compte"
    expect(find.widgetWithText(ElevatedButton, 'Créer un compte'), findsOneWidget);
    // Toggle button should be "Déjà un compte ? Se connecter"
    expect(find.widgetWithText(TextButton, 'Déjà un compte ? Se connecter'), findsOneWidget);

    // Tap toggle button again to switch back to Login
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    // Back to Login state
    expect(find.widgetWithText(ElevatedButton, 'Se connecter'), findsOneWidget);
    expect(find.widgetWithText(TextButton, 'Pas encore de compte ? Créer un compte'), findsOneWidget);
  });
}
