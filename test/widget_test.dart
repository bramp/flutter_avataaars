import 'package:flutter_test/flutter_test.dart';

import 'package:avataaars/main.dart';

void main() {
  testWidgets('App renders', (WidgetTester tester) async {
    await tester.pumpWidget(const AvataaarsApp());
    expect(find.text('Avataaars Generator'), findsOneWidget);
  });
}
