import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';
import 'package:home_care/screens/dashboard_screen.dart';
import 'package:home_care/screens/request_screen.dart';
import 'package:home_care/screens/booking_payment_screen.dart';

void main() {
  testWidgets('App full navigation flow to BookingScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    // Enter valid text and navigate to Dashboard
    await tester.enterText(find.byType(TextFormField).first, '77123456');
    await tester.enterText(find.byType(TextFormField).last, 'password123');
    await tester.pumpAndSettle();

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    // Tap on Request button
    await tester.tap(find.text('Demander un\nprélèvement'));
    await tester.pumpAndSettle();

    // Tap on Photo button to go to Booking
    await tester.tap(find.text('Prendre en photo\nmon ordonnance'));
    await tester.pumpAndSettle();

    // Verify Booking Payment Screen
    expect(find.byType(BookingPaymentScreen), findsOneWidget);
    expect(find.text('1. Choisissez la date et l\'heure'), findsOneWidget);
    expect(find.text('2. Paiement Mobile'), findsOneWidget);
    expect(find.text('D-money'), findsOneWidget);
    expect(find.text('Waafi'), findsOneWidget);
    expect(find.text('CaCpay'), findsOneWidget);
  });
}
