import 'dart:io';

import 'package:avatar_builder/avatar_builder.dart';
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

  group('JSON serialisation', () {
    test('toJson produces expected keys', () {
      final avatar = Avataaar();
      final json = avatar.toJson();
      expect(json, containsPair('style', 'circle'));
      expect(json, containsPair('topType', 'longHairStraight'));
      expect(json, containsPair('accessoriesType', 'blank'));
      expect(json, contains('hairColor'));
      expect(json, contains('skinColor'));
    });

    test('roundtrip preserves all fields', () {
      final original = Avataaar(
        style: AvatarStyle.transparent,
        topType: TopType.winterHat2,
        accessoriesType: AccessoriesType.sunglasses,
        hairColor: HairColor.auburn.color,
        hatColor: HatColor.red.color,
        facialHairType: FacialHairType.beardMajestic,
        facialHairColor: FacialHairColor.blonde.color,
        clotheType: ClotheType.graphicShirt,
        clotheColor: ClotheColor.pink.color,
        graphicType: GraphicType.pizza,
        eyeType: EyeType.hearts,
        eyebrowType: EyebrowType.raisedExcitedNatural,
        mouthType: MouthType.smile,
        skinColor: SkinColor.tanned.color,
      );
      final json = original.toJson();
      final restored = Avataaar.fromJson(json);

      expect(restored.style, original.style);
      expect(restored.topType, original.topType);
      expect(restored.accessoriesType, original.accessoriesType);
      expect(restored.hairColor, original.hairColor);
      expect(restored.hatColor, original.hatColor);
      expect(restored.facialHairType, original.facialHairType);
      expect(restored.facialHairColor, original.facialHairColor);
      expect(restored.clotheType, original.clotheType);
      expect(restored.clotheColor, original.clotheColor);
      expect(restored.graphicType, original.graphicType);
      expect(restored.eyeType, original.eyeType);
      expect(restored.eyebrowType, original.eyebrowType);
      expect(restored.mouthType, original.mouthType);
      expect(restored.skinColor, original.skinColor);
    });

    test('roundtrip with custom colors', () {
      final original = Avataaar(
        hairColor: const Color(0xFF123456),
        skinColor: const Color(0xFFABCDEF),
      );
      final json = original.toJson();
      final restored = Avataaar.fromJson(json);
      expect(restored.hairColor, original.hairColor);
      expect(restored.skinColor, original.skinColor);
    });

    test('fromJson with defaults', () {
      final avatar = Avataaar();
      final json = avatar.toJson();
      final restored = Avataaar.fromJson(json);
      expect(restored.style, avatar.style);
      expect(restored.topType, avatar.topType);
      expect(restored.skinColor, avatar.skinColor);
    });
  });
}
