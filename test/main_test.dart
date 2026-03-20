import 'package:avataaars/avataaars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AvatarWidget renders', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AvatarWidget(avatar: Avataaar()),
        ),
      ),
    );
    expect(find.byType(AvatarWidget), findsOneWidget);
  });

  test('Avataaar.random() produces valid avatar', () {
    final avatar = Avataaar.random();
    expect(avatar.topType, isNotNull);
    expect(avatar.eyeType, isNotNull);
    expect(avatar.skinColor, isNotNull);
  });

  test('Avataaar.copyWith() preserves unchanged fields', () {
    final original = Avataaar();
    final modified = original.copyWith(eyeType: EyeType.hearts);
    expect(modified.eyeType, EyeType.hearts);
    expect(modified.topType, original.topType);
    expect(modified.skinColor, original.skinColor);
  });
}
