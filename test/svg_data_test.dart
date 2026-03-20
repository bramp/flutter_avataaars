// Regression tests for SVG data functions.
//
// These tests guard against unintended changes during refactoring.
// The golden file captures the exact output of every SVG function for
// every enum value. Any change to SVG output will cause a test failure.
//
// Run `flutter test --update-goldens` to regenerate the golden file.

import 'dart:io';

import 'package:avataaars/src/models/avatar_style.dart';
import 'package:avataaars/src/svg/svg_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('getSkinColorHex', () {
    test('returns correct hex for each skin color', () {
      expect(getSkinColorHex(SkinColor.tanned), '#FD9841');
      expect(getSkinColorHex(SkinColor.yellow), '#F8D25C');
      expect(getSkinColorHex(SkinColor.pale), '#FFDBB4');
      expect(getSkinColorHex(SkinColor.light), '#EDB98A');
      expect(getSkinColorHex(SkinColor.brown), '#D08B5B');
      expect(getSkinColorHex(SkinColor.darkBrown), '#AE5D29');
      expect(getSkinColorHex(SkinColor.black), '#614335');
    });
  });

  group('getHairColorHex', () {
    test('returns correct hex for each hair color', () {
      expect(getHairColorHex(HairColor.auburn), '#A55728');
      expect(getHairColorHex(HairColor.black), '#2C1B18');
      expect(getHairColorHex(HairColor.blonde), '#B58143');
      expect(getHairColorHex(HairColor.blondeGolden), '#D6B370');
      expect(getHairColorHex(HairColor.brown), '#724133');
      expect(getHairColorHex(HairColor.brownDark), '#4A312C');
      expect(getHairColorHex(HairColor.pastelPink), '#F59797');
      expect(getHairColorHex(HairColor.blue), '#000FDB');
      expect(getHairColorHex(HairColor.platinum), '#ECDCBF');
      expect(getHairColorHex(HairColor.red), '#C93305');
      expect(getHairColorHex(HairColor.silverGray), '#E8E1E1');
    });
  });

  group('getClotheColorHex', () {
    test('returns correct hex for each clothe color', () {
      expect(getClotheColorHex(ClotheColor.black), '#262E33');
      expect(getClotheColorHex(ClotheColor.blue01), '#65C9FF');
      expect(getClotheColorHex(ClotheColor.blue02), '#5199E4');
      expect(getClotheColorHex(ClotheColor.blue03), '#25557C');
      expect(getClotheColorHex(ClotheColor.gray01), '#929598');
      expect(getClotheColorHex(ClotheColor.gray02), '#E6E6E6');
      expect(getClotheColorHex(ClotheColor.heather), '#3C4F5C');
      expect(getClotheColorHex(ClotheColor.pastelBlue), '#B1E2FF');
      expect(getClotheColorHex(ClotheColor.pastelGreen), '#A7FFC4');
      expect(getClotheColorHex(ClotheColor.pastelOrange), '#FFDEB5');
      expect(getClotheColorHex(ClotheColor.pastelRed), '#FFAFB9');
      expect(getClotheColorHex(ClotheColor.pastelYellow), '#FFFFB1');
      expect(getClotheColorHex(ClotheColor.pink), '#FF488E');
      expect(getClotheColorHex(ClotheColor.red), '#FF5C5C');
      expect(getClotheColorHex(ClotheColor.white), '#FFFFFF');
    });
  });

  group('getHatColorHex', () {
    test('returns correct hex for each hat color', () {
      expect(getHatColorHex(HatColor.black), '#262E33');
      expect(getHatColorHex(HatColor.blue01), '#65C9FF');
      expect(getHatColorHex(HatColor.blue02), '#5199E4');
      expect(getHatColorHex(HatColor.blue03), '#25557C');
      expect(getHatColorHex(HatColor.gray01), '#929598');
      expect(getHatColorHex(HatColor.gray02), '#E6E6E6');
      expect(getHatColorHex(HatColor.heather), '#3C4F5C');
      expect(getHatColorHex(HatColor.pastelBlue), '#B1E2FF');
      expect(getHatColorHex(HatColor.pastelGreen), '#A7FFC4');
      expect(getHatColorHex(HatColor.pastelOrange), '#FFDEB5');
      expect(getHatColorHex(HatColor.pastelRed), '#FFAFB9');
      expect(getHatColorHex(HatColor.pastelYellow), '#FFFFB1');
      expect(getHatColorHex(HatColor.pink), '#FF488E');
      expect(getHatColorHex(HatColor.red), '#FF5C5C');
      expect(getHatColorHex(HatColor.white), '#FFFFFF');
    });
  });

  group('getFacialHairColorHex', () {
    test('returns correct hex for each facial hair color', () {
      expect(getFacialHairColorHex(FacialHairColor.auburn), '#A55728');
      expect(getFacialHairColorHex(FacialHairColor.black), '#2C1B18');
      expect(getFacialHairColorHex(FacialHairColor.blonde), '#B58143');
      expect(getFacialHairColorHex(FacialHairColor.blondeGolden), '#D6B370');
      expect(getFacialHairColorHex(FacialHairColor.brown), '#724133');
      expect(getFacialHairColorHex(FacialHairColor.brownDark), '#4A312C');
      expect(getFacialHairColorHex(FacialHairColor.platinum), '#E8E1E1');
      expect(getFacialHairColorHex(FacialHairColor.red), '#C93305');
    });
  });

  group('SVG fragment structural validity', () {
    test('getEyeSvg returns valid SVG for all types', () {
      for (final type in EyeType.values) {
        final svg = getEyeSvg(type);
        expect(svg, isNotEmpty, reason: '${type.name}');
        expect(svg, startsWith('<g '), reason: '${type.name}');
        expect(svg, endsWith('</g>'), reason: '${type.name}');
      }
    });

    test('getEyebrowSvg returns valid SVG for all types', () {
      for (final type in EyebrowType.values) {
        final svg = getEyebrowSvg(type);
        expect(svg, isNotEmpty, reason: '${type.name}');
        expect(svg, startsWith('<g '), reason: '${type.name}');
        expect(svg, endsWith('</g>'), reason: '${type.name}');
      }
    });

    test('getMouthSvg returns valid SVG for all types', () {
      for (final type in MouthType.values) {
        final svg = getMouthSvg(type);
        expect(svg, isNotEmpty, reason: '${type.name}');
        expect(svg, startsWith('<g '), reason: '${type.name}');
        expect(svg, endsWith('</g>'), reason: '${type.name}');
      }
    });

    test('getClothingSvg returns valid SVG for all types', () {
      for (final type in ClotheType.values) {
        final svg = getClothingSvg(type, GraphicType.bat);
        expect(svg, isNotEmpty, reason: '${type.name}');
        expect(svg, startsWith('<g '), reason: '${type.name}');
        expect(svg, endsWith('</g>'), reason: '${type.name}');
      }
    });

    test('getClothingSvg graphicShirt varies by graphic type', () {
      final svgs = <String>{};
      for (final gType in GraphicType.values) {
        svgs.add(getClothingSvg(ClotheType.graphicShirt, gType));
      }
      expect(svgs, hasLength(GraphicType.values.length));
    });

    test('getTopSvg returns valid SVG for all types', () {
      for (final type in TopType.values) {
        final svg = getTopSvg(type);
        expect(svg, isNotEmpty, reason: '${type.name}');
        expect(svg, startsWith('<g '), reason: '${type.name}');
        expect(svg, endsWith('</g>'), reason: '${type.name}');
      }
    });

    test('getAccessorySvg returns SVG for all types', () {
      for (final type in AccessoriesType.values) {
        final svg = getAccessorySvg(type);
        if (svg.isNotEmpty) {
          expect(svg, startsWith('<g '), reason: '${type.name}');
          expect(svg, endsWith('</g>'), reason: '${type.name}');
        }
      }
    });

    test('getFacialHairSvg returns SVG for all types', () {
      for (final type in FacialHairType.values) {
        final svg = getFacialHairSvg(type);
        if (svg.isNotEmpty) {
          expect(svg, startsWith('<g '), reason: '${type.name}');
          expect(svg, endsWith('</g>'), reason: '${type.name}');
        }
      }
    });
  });

  group('buildAvatarSvg', () {
    test('produces valid SVG with default configuration', () {
      final svg = buildAvatarSvg(
        topType: TopType.longHairStraight,
        accessoriesType: AccessoriesType.blank,
        hairColor: HairColor.brownDark,
        hatColor: HatColor.gray01,
        facialHairType: FacialHairType.blank,
        facialHairColor: FacialHairColor.brownDark,
        clotheType: ClotheType.shirtCrewNeck,
        clotheColor: ClotheColor.gray01,
        graphicType: GraphicType.bat,
        eyeType: EyeType.defaultEye,
        eyebrowType: EyebrowType.defaultBrow,
        mouthType: MouthType.defaultMouth,
        skinColor: SkinColor.light,
      );
      expect(svg, startsWith('<svg '));
      expect(svg, endsWith('</svg>'));
      expect(svg, contains('viewBox="0 0 264 280"'));
      // No unreplaced placeholders.
      expect(svg, isNot(contains('{{')));
      expect(svg, isNot(contains('}}')));
    });

    test('produces valid SVG with all non-default options', () {
      final svg = buildAvatarSvg(
        topType: TopType.winterHat2,
        accessoriesType: AccessoriesType.sunglasses,
        hairColor: HairColor.red,
        hatColor: HatColor.pink,
        facialHairType: FacialHairType.beardMajestic,
        facialHairColor: FacialHairColor.auburn,
        clotheType: ClotheType.graphicShirt,
        clotheColor: ClotheColor.blue03,
        graphicType: GraphicType.pizza,
        eyeType: EyeType.hearts,
        eyebrowType: EyebrowType.raisedExcitedNatural,
        mouthType: MouthType.smile,
        skinColor: SkinColor.darkBrown,
      );
      expect(svg, startsWith('<svg '));
      expect(svg, endsWith('</svg>'));
      // Check color substitutions happened.
      expect(svg, contains('#AE5D29')); // darkBrown skin
      expect(svg, contains('#25557C')); // blue03 clothe
      expect(svg, contains('#FF488E')); // pink hat
      expect(svg, contains('#A55728')); // auburn facial hair
      expect(svg, isNot(contains('{{')));
      expect(svg, isNot(contains('}}')));
    });

    test('no unreplaced placeholders for every combination of types', () {
      // Test every top/clothing/accessory/facial-hair type to ensure
      // buildAvatarSvg handles all of them without leaving placeholders.
      for (final topType in TopType.values) {
        for (final clotheType in ClotheType.values) {
          final svg = buildAvatarSvg(
            topType: topType,
            accessoriesType: AccessoriesType.prescription01,
            hairColor: HairColor.auburn,
            hatColor: HatColor.red,
            facialHairType: FacialHairType.beardMedium,
            facialHairColor: FacialHairColor.black,
            clotheType: clotheType,
            clotheColor: ClotheColor.blue01,
            graphicType: GraphicType.diamond,
            eyeType: EyeType.happy,
            eyebrowType: EyebrowType.defaultNatural,
            mouthType: MouthType.smile,
            skinColor: SkinColor.pale,
          );
          expect(
            svg,
            isNot(contains('{{')),
            reason: 'top=${topType.name} clothe=${clotheType.name}',
          );
        }
      }
    });
  });

  group('SVG output golden test', () {
    test('all SVG outputs match golden file', () {
      final actual = _buildGoldenContent();
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

/// Builds a deterministic string containing all SVG function outputs.
///
/// Each entry is formatted as:
/// ```
/// ### functionName(enumValue)
/// <svg content>
/// ```
String _buildGoldenContent() {
  final buffer = StringBuffer();

  for (final type in EyeType.values) {
    buffer.writeln('### getEyeSvg(${type.name})');
    buffer.writeln(getEyeSvg(type));
    buffer.writeln();
  }

  for (final type in EyebrowType.values) {
    buffer.writeln('### getEyebrowSvg(${type.name})');
    buffer.writeln(getEyebrowSvg(type));
    buffer.writeln();
  }

  for (final type in MouthType.values) {
    buffer.writeln('### getMouthSvg(${type.name})');
    buffer.writeln(getMouthSvg(type));
    buffer.writeln();
  }

  // For non-graphicShirt types, graphicType is ignored — test once.
  // For graphicShirt, test each GraphicType.
  for (final type in ClotheType.values) {
    if (type == ClotheType.graphicShirt) {
      for (final gType in GraphicType.values) {
        buffer.writeln('### getClothingSvg(${type.name}, ${gType.name})');
        buffer.writeln(getClothingSvg(type, gType));
        buffer.writeln();
      }
    } else {
      buffer.writeln('### getClothingSvg(${type.name})');
      buffer.writeln(getClothingSvg(type, GraphicType.bat));
      buffer.writeln();
    }
  }

  for (final type in TopType.values) {
    buffer.writeln('### getTopSvg(${type.name})');
    buffer.writeln(getTopSvg(type));
    buffer.writeln();
  }

  for (final type in AccessoriesType.values) {
    buffer.writeln('### getAccessorySvg(${type.name})');
    buffer.writeln(getAccessorySvg(type));
    buffer.writeln();
  }

  for (final type in FacialHairType.values) {
    buffer.writeln('### getFacialHairSvg(${type.name})');
    buffer.writeln(getFacialHairSvg(type));
    buffer.writeln();
  }

  // Full avatar composition with known configurations.
  buffer.writeln('### buildAvatarSvg(default)');
  buffer.writeln(buildAvatarSvg(
    topType: TopType.longHairStraight,
    accessoriesType: AccessoriesType.blank,
    hairColor: HairColor.brownDark,
    hatColor: HatColor.gray01,
    facialHairType: FacialHairType.blank,
    facialHairColor: FacialHairColor.brownDark,
    clotheType: ClotheType.shirtCrewNeck,
    clotheColor: ClotheColor.gray01,
    graphicType: GraphicType.bat,
    eyeType: EyeType.defaultEye,
    eyebrowType: EyebrowType.defaultBrow,
    mouthType: MouthType.defaultMouth,
    skinColor: SkinColor.light,
  ));
  buffer.writeln();

  buffer.writeln('### buildAvatarSvg(custom)');
  buffer.writeln(buildAvatarSvg(
    topType: TopType.winterHat2,
    accessoriesType: AccessoriesType.sunglasses,
    hairColor: HairColor.red,
    hatColor: HatColor.pink,
    facialHairType: FacialHairType.beardMajestic,
    facialHairColor: FacialHairColor.auburn,
    clotheType: ClotheType.graphicShirt,
    clotheColor: ClotheColor.blue03,
    graphicType: GraphicType.pizza,
    eyeType: EyeType.hearts,
    eyebrowType: EyebrowType.raisedExcitedNatural,
    mouthType: MouthType.smile,
    skinColor: SkinColor.darkBrown,
  ));
  buffer.writeln();

  return buffer.toString();
}
