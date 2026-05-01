import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';

void main() {
  testWidgets('Login validation test', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    final loginButton = find.text('Se connecter');

    // 1. Test empty fields
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Veuillez entrer votre identifiant'), findsOneWidget);
    expect(find.text('Veuillez entrer votre mot de passe'), findsOneWidget);

    // 2. Test invalid format
    await tester.enterText(find.byType(TextFormField).first, 'invalid');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Veuillez entrer un email ou numéro valide'), findsOneWidget);

    // 3. Test valid email
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Veuillez entrer un email ou numéro valide'), findsNothing);

    // 4. Test valid Djibouti phone number
    await tester.enterText(find.byType(TextFormField).first, '77123456');
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Veuillez entrer un email ou numéro valide'), findsNothing);

    // 5. Test valid Djibouti phone number with prefix
    await tester.enterText(find.byType(TextFormField).first, '+25377123456');
    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Veuillez entrer un email ou numéro valide'), findsNothing);
  });
}
