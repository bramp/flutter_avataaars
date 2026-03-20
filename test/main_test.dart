import 'dart:io';

import 'package:flutter_avataaars/flutter_avataaars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Read all SVG asset files from disk and return an [SvgCache] populated
/// with pairs of (Flutter asset key -> file content).
SvgCache _loadCacheFromDisk() {
  const prefix = 'packages/avataaars/lib/assets';
  const diskPrefix = 'lib/assets';
  final map = <String, String>{};

  final dir = Directory(diskPrefix);
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.svgf')) {
      final relative = entity.path.substring(diskPrefix.length + 1);
      map['$prefix/$relative'] = entity.readAsStringSync();
    }
  }
  return SvgCache.fromMap(map);
}

void main() {
  testWidgets('AvatarWidget renders', (tester) async {
    final cache = _loadCacheFromDisk();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AvatarWidget(avatar: Avataaar(), cache: cache),
        ),
      ),
    );
    await tester.pumpAndSettle();
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
