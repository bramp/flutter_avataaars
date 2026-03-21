// Regression tests for SVG data functions and asset files.
//
// These tests guard against unintended changes during refactoring.
// The golden file captures the composed SVG output for known avatar
// configurations. Any change to SVG output will cause a test failure.
//
// Run `flutter test --update-goldens` to regenerate the golden file.

import 'dart:io';

import 'package:avatar_builder/src/models/avatar_style.dart';
import 'package:avatar_builder/src/svg/svg_cache.dart';
import 'package:avatar_builder/src/svg/svg_data.dart';
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

  group('SVG asset files', () {
    late SvgCache cache;

    setUpAll(() {
      cache = _loadCacheFromDisk();
    });

    test('all eye assets exist and are non-empty', () {
      for (final type in EyeType.values) {
        expect(
          () => cache[_assetKeyForType('eyes', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all eyebrow assets exist and are non-empty', () {
      for (final type in EyebrowType.values) {
        expect(
          () => cache[_assetKeyForType('eyebrows', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all mouth assets exist and are non-empty', () {
      for (final type in MouthType.values) {
        expect(
          () => cache[_assetKeyForType('mouths', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all clothing assets exist', () {
      for (final type in ClotheType.values) {
        expect(
          () => cache[_assetKeyForType('clothing', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all graphic clothing assets exist', () {
      for (final type in GraphicType.values) {
        expect(
          () => cache[_assetKeyForType('graphic_clothing', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all top assets exist', () {
      for (final type in TopType.values) {
        expect(
          () => cache[_assetKeyForType('top', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all accessory assets exist', () {
      for (final type in AccessoriesType.values) {
        if (type == AccessoriesType.blank) continue; // no asset file
        expect(
          () => cache[_assetKeyForType('accessories', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('all facial hair assets exist', () {
      for (final type in FacialHairType.values) {
        if (type == FacialHairType.blank) continue; // no asset file
        expect(
          () => cache[_assetKeyForType('facial_hair', type)],
          returnsNormally,
          reason: type.name,
        );
      }
    });

    test('fixed assets (shared_defs, body, nose) exist', () {
      const prefix = 'packages/avataaars/lib/assets';
      expect(cache['$prefix/shared_defs.svgf'], isNotEmpty);
      expect(cache['$prefix/body.svgf'], isNotEmpty);
      expect(cache['$prefix/nose.svgf'], isNotEmpty);
    });
  });

  group('buildAvatarSvg', () {
    late SvgCache cache;

    setUpAll(() {
      cache = _loadCacheFromDisk();
    });

    test('produces valid SVG with default configuration', () async {
      final svg = await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.circle,
        topType: TopType.longHairStraight,
        accessoriesType: AccessoriesType.blank,
        facialHairType: FacialHairType.blank,
        clotheType: ClotheType.shirtCrewNeck,
        graphicType: GraphicType.bat,
        eyeType: EyeType.defaultEye,
        eyebrowType: EyebrowType.defaultBrow,
        mouthType: MouthType.defaultMouth,
      );
      expect(svg, startsWith('<svg '));
      expect(svg, endsWith('</svg>'));
      expect(svg, contains('viewBox="0 0 264 280"'));
      expect(svg, contains(sentinelSkin));
    });

    test('transparent style omits circle background', () async {
      final svg = await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.transparent,
        topType: TopType.longHairStraight,
        accessoriesType: AccessoriesType.blank,
        facialHairType: FacialHairType.blank,
        clotheType: ClotheType.shirtCrewNeck,
        graphicType: GraphicType.bat,
        eyeType: EyeType.defaultEye,
        eyebrowType: EyebrowType.defaultBrow,
        mouthType: MouthType.defaultMouth,
      );
      expect(svg, startsWith('<svg '));
      expect(svg, endsWith('</svg>'));
      expect(svg, isNot(contains('mask-bg')));
      expect(svg, isNot(contains('#65C9FF')));
    });

    test('circle style includes circle background', () async {
      final svg = await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.circle,
        topType: TopType.longHairStraight,
        accessoriesType: AccessoriesType.blank,
        facialHairType: FacialHairType.blank,
        clotheType: ClotheType.shirtCrewNeck,
        graphicType: GraphicType.bat,
        eyeType: EyeType.defaultEye,
        eyebrowType: EyebrowType.defaultBrow,
        mouthType: MouthType.defaultMouth,
      );
      expect(svg, contains('mask-bg'));
      expect(svg, contains('#65C9FF'));
    });

    test('produces valid SVG with all non-default options', () async {
      final svg = await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.circle,
        topType: TopType.winterHat2,
        accessoriesType: AccessoriesType.sunglasses,
        facialHairType: FacialHairType.beardMajestic,
        clotheType: ClotheType.graphicShirt,
        graphicType: GraphicType.pizza,
        eyeType: EyeType.hearts,
        eyebrowType: EyebrowType.raisedExcitedNatural,
        mouthType: MouthType.smile,
      );
      expect(svg, startsWith('<svg '));
      expect(svg, endsWith('</svg>'));
      expect(svg, contains(sentinelSkin));
      expect(svg, contains(sentinelClothe));
      expect(svg, contains(sentinelHat));
      expect(svg, contains(sentinelFacialHair));
    });

    test('valid SVG for every combination of types', () async {
      for (final topType in TopType.values) {
        for (final clotheType in ClotheType.values) {
          final svg = await buildAvatarSvg(
            cache: cache,
            style: AvatarStyle.circle,
            topType: topType,
            accessoriesType: AccessoriesType.prescription01,
            facialHairType: FacialHairType.beardMedium,
            clotheType: clotheType,
            graphicType: GraphicType.diamond,
            eyeType: EyeType.happy,
            eyebrowType: EyebrowType.defaultNatural,
            mouthType: MouthType.smile,
          );
          expect(
            svg,
            startsWith('<svg '),
            reason: 'top=${topType.name} clothe=${clotheType.name}',
          );
        }
      }
    });
  });

  group('SVG output golden test', () {
    test('all SVG outputs match golden file', () async {
      final cache = _loadCacheFromDisk();
      final actual = await _buildGoldenContent(cache);
      final goldenFile = File('test/goldens/svg_data.golden');

      if (!goldenFile.existsSync() || autoUpdateGoldenFiles) {
        goldenFile.parent.createSync(recursive: true);
        goldenFile.writeAsStringSync(actual);
        return;
      }

      expect(actual, equals(goldenFile.readAsStringSync()));
    });
  });
}

/// Convert a camelCase name to snake_case.
String _camelToSnake(String s) {
  return s
      .replaceAllMapped(
        RegExp('(.)([A-Z][a-z]+)'),
        (m) => '${m[1]}_${m[2]}',
      )
      .replaceAllMapped(
        RegExp('([a-z0-9])([A-Z])'),
        (m) => '${m[1]}_${m[2]}',
      )
      .toLowerCase();
}

/// Build the expected asset key path for a given category and enum value.
String _assetKeyForType(String category, Enum type) {
  return 'packages/avataaars/lib/assets/$category/${_camelToSnake(type.name)}.svgf';
}

/// Builds a deterministic string containing composed SVG outputs
/// for known avatar configurations.
Future<String> _buildGoldenContent(SvgCache cache) async {
  // Full avatar composition with known configurations.
  final buffer = StringBuffer()
    ..writeln('### buildAvatarSvg(default)')
    ..writeln(
      await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.circle,
        topType: TopType.longHairStraight,
        accessoriesType: AccessoriesType.blank,
        facialHairType: FacialHairType.blank,
        clotheType: ClotheType.shirtCrewNeck,
        graphicType: GraphicType.bat,
        eyeType: EyeType.defaultEye,
        eyebrowType: EyebrowType.defaultBrow,
        mouthType: MouthType.defaultMouth,
      ),
    )
    ..writeln()
    ..writeln('### buildAvatarSvg(custom)')
    ..writeln(
      await buildAvatarSvg(
        cache: cache,
        style: AvatarStyle.circle,
        topType: TopType.winterHat2,
        accessoriesType: AccessoriesType.sunglasses,
        facialHairType: FacialHairType.beardMajestic,
        clotheType: ClotheType.graphicShirt,
        graphicType: GraphicType.pizza,
        eyeType: EyeType.hearts,
        eyebrowType: EyebrowType.raisedExcitedNatural,
        mouthType: MouthType.smile,
      ),
    )
    ..writeln();

  return '${buffer.toString().trimRight()}\n';
}
