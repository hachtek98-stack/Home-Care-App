import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';
import 'package:home_care/screens/dashboard_screen.dart';

void main() {
  testWidgets('App starts with LoginScreen and navigates to DashboardScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    expect(find.text('Home Care'), findsOneWidget);
    expect(find.text('Service BioHome'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);

    await tester.tap(find.text('Se connecter'));
    await tester.pumpAndSettle();

    expect(find.byType(DashboardScreen), findsOneWidget);
    expect(find.text('Demander un\nprélèvement'), findsOneWidget);
    expect(find.text('Suivre mon\ninfirmier'), findsOneWidget);
    expect(find.text('Mon Coffre-fort\nMédical'), findsOneWidget);
  });
}
