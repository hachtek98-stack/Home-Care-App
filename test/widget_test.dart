import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';
import 'package:home_care/screens/dashboard_screen.dart';

void main() {
  testWidgets('App starts with LoginScreen and handles validation', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    expect(find.text('Home Care'), findsOneWidget);
    expect(find.text('Service BioHome'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);

    // Should fail validation since we haven't entered anything
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.text('Veuillez entrer votre numéro de téléphone'), findsOneWidget);
    expect(find.text('Le mot de passe est obligatoire'), findsOneWidget);

    // Enter text
    await tester.enterText(find.byType(TextFormField).first, '77123456');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pumpAndSettle();

    // Now it should pass and navigate
    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
