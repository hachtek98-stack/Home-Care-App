import 'package:flutter_test/flutter_test.dart';
import 'package:home_care/main.dart';

void main() {
  testWidgets('App starts with LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const HomeCareApp());

    expect(find.text('Home Care'), findsOneWidget);
    expect(find.text('Service BioHome'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
