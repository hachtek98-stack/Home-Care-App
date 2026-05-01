import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';
import 'package:home_care/screens/dashboard_screen.dart';
import 'package:home_care/screens/vault_screen.dart';

void main() {
  testWidgets('App full navigation flow to VaultScreen and unlocks', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    // Enter valid text and navigate to Dashboard
    await tester.enterText(find.byType(TextFormField).first, '77123456');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    // In DashboardScreen
    expect(find.byType(DashboardScreen), findsOneWidget);

    // Tap on Vault button
    await tester.tap(find.text('Mon Coffre-fort\nMédical'));
    await tester.pumpAndSettle();

    // Verify Vault Screen Locked View
    expect(find.byType(VaultScreen), findsOneWidget);
    expect(find.text('Entrez votre code PIN pour accéder à vos résultats.'), findsOneWidget);

    // Enter PIN and unlock
    await tester.enterText(find.byType(TextField), '1234');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Déverrouiller'));
    await tester.pumpAndSettle();

    // Verify Unlocked View
    expect(find.text('Vos Documents Sécurisés'), findsOneWidget);
    expect(find.text('Résultats d\'analyse Sanguine'), findsOneWidget);
  });
}
