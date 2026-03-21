// ignore_for_file: avoid_print // Example uses print for demonstration output.

import 'dart:io';
import 'dart:math';

import 'package:avatar_builder_core/avatar_builder_core.dart';

/// An [AssetLoader] that reads SVG fragment files from disk.
///
/// Adjust the path to point to where the asset files are located.
Future<String> loadAsset(String key) async {
  if (key.isEmpty) return '';
  return File('lib/assets/$key').readAsString();
}

Future<void> main() async {
  // Create a specific avatar.
  final avatar = Avataaar(
    topType: TopType.shortHairShortFlat,
    accessoriesType: AccessoriesType.prescription01,
    hairColor: HairColor.brown.color,
    clotheType: ClotheType.hoodie,
    clotheColor: ClotheColor.blue01.color,
    eyeType: EyeType.happy,
    mouthType: MouthType.smile,
    skinColor: SkinColor.light.color,
  );

  // Render to SVG and save.
  final svg = await avatar.toSvg(loadAsset: loadAsset);
  File('avatar.svg').writeAsStringSync(svg);
  print('Saved avatar.svg');

  // Generate a random avatar.
  final random = Avataaar.random();
  final randomSvg = await random.toSvg(loadAsset: loadAsset);
  File('random_avatar.svg').writeAsStringSync(randomSvg);
  print('Saved random_avatar.svg');

  // Serialise to JSON and back.
  final json = avatar.toJson();
  print('JSON: $json');

  final restored = Avataaar.fromJson(json);
  print('Restored eye type: ${restored.eyeType}');
}
