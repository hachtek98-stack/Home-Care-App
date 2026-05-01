import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';
import 'package:home_care/screens/dashboard_screen.dart';
import 'package:home_care/screens/request_screen.dart';

void main() {
  testWidgets('App starts with LoginScreen and navigates to DashboardScreen, then to RequestScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    expect(find.text('Home Care'), findsOneWidget);

    // Enter valid text and navigate
    await tester.enterText(find.byType(TextFormField).first, '77123456');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    // In DashboardScreen
    expect(find.byType(DashboardScreen), findsOneWidget);

    // Tap on Request button
    await tester.tap(find.text('Demander un\nprélèvement'));
    await tester.pumpAndSettle();

    // In RequestScreen
    expect(find.byType(RequestScreen), findsOneWidget);
    expect(find.text('Prendre en photo\nmon ordonnance'), findsOneWidget);
    expect(find.text('Télécharger un fichier'), findsOneWidget);
  });
}
