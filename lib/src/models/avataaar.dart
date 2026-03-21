import 'dart:math';

import 'package:avatar_builder/src/models/avatar_style.dart';
import 'package:avatar_builder/src/svg/svg_cache.dart';
import 'package:avatar_builder/src/svg/svg_data.dart';
import 'package:avatar_builder/src/widgets/avatar_color_mapper.dart';
import 'package:flutter/painting.dart';

export 'package:avatar_builder/src/models/avatar_style.dart';

/// Holds the full set of selected avatar attributes.
///
/// Color fields store [Color] values directly, allowing both predefined
/// palette colors (via the enums in `avatar_style.dart`) and fully custom
/// colors. Use the convenience getters like [hairColorEnum] to look up
/// the matching palette entry (returns `null` for custom colors).
class Avataaar {
  /// Creates an avatar with the given attributes, using sensible defaults.
  Avataaar({
    this.style = AvatarStyle.circle,
    this.topType = TopType.longHairStraight,
    this.accessoriesType = AccessoriesType.blank,
    Color? hairColor,
    Color? hatColor,
    this.facialHairType = FacialHairType.blank,
    Color? facialHairColor,
    this.clotheType = ClotheType.shirtCrewNeck,
    Color? clotheColor,
    this.graphicType = GraphicType.bat,
    this.eyeType = EyeType.defaultEye,
    this.eyebrowType = EyebrowType.defaultBrow,
    this.mouthType = MouthType.defaultMouth,
    Color? skinColor,
  })  : hairColor = hairColor ?? HairColor.brownDark.color,
        hatColor = hatColor ?? HatColor.gray01.color,
        facialHairColor = facialHairColor ?? FacialHairColor.brownDark.color,
        clotheColor = clotheColor ?? ClotheColor.gray01.color,
        skinColor = skinColor ?? SkinColor.light.color;

  /// Generate a completely random avatar.
  // TODO(bramp): Bias some of these picks.
  factory Avataaar.random([Random? rng]) {
    final r = rng ?? Random();
    T pick<T>(List<T> values) => values[r.nextInt(values.length)];
    return Avataaar(
      style: pick(AvatarStyle.values),
      topType: pick(TopType.values),
      accessoriesType: pick(AccessoriesType.values),
      hairColor: pick(HairColor.values).color,
      hatColor: pick(HatColor.values).color,
      facialHairType: pick(FacialHairType.values),
      facialHairColor: pick(FacialHairColor.values).color,
      clotheType: pick(ClotheType.values),
      clotheColor: pick(ClotheColor.values).color,
      graphicType: pick(GraphicType.values),
      eyeType: pick(EyeType.values),
      eyebrowType: pick(EyebrowType.values),
      mouthType: pick(MouthType.values),
      skinColor: pick(SkinColor.values).color,
    );
  }

  /// Creates an [Avataaar] from a JSON map (as produced by [toJson]).
  factory Avataaar.fromJson(Map<String, dynamic> json) {
    return Avataaar(
      style: AvatarStyle.values.byName(json['style'] as String),
      topType: TopType.values.byName(json['topType'] as String),
      accessoriesType:
          AccessoriesType.values.byName(json['accessoriesType'] as String),
      hairColor: _hexToColor(json['hairColor'] as String),
      hatColor: _hexToColor(json['hatColor'] as String),
      facialHairType:
          FacialHairType.values.byName(json['facialHairType'] as String),
      facialHairColor: _hexToColor(json['facialHairColor'] as String),
      clotheType: ClotheType.values.byName(json['clotheType'] as String),
      clotheColor: _hexToColor(json['clotheColor'] as String),
      graphicType: GraphicType.values.byName(json['graphicType'] as String),
      eyeType: EyeType.values.byName(json['eyeType'] as String),
      eyebrowType: EyebrowType.values.byName(json['eyebrowType'] as String),
      mouthType: MouthType.values.byName(json['mouthType'] as String),
      skinColor: _hexToColor(json['skinColor'] as String),
    );
  }

  /// Returns the [HairColor] enum matching [hairColor], or `null`.
  HairColor? get hairColorEnum =>
      HairColor.values.where((e) => e.color == hairColor).firstOrNull;

  /// Returns the [HatColor] enum matching [hatColor], or `null`.
  HatColor? get hatColorEnum =>
      HatColor.values.where((e) => e.color == hatColor).firstOrNull;

  /// Returns the [FacialHairColor] enum matching [facialHairColor],
  /// or `null`.
  FacialHairColor? get facialHairColorEnum => FacialHairColor.values
      .where((e) => e.color == facialHairColor)
      .firstOrNull;

  /// Returns the [ClotheColor] enum matching [clotheColor], or `null`.
  ClotheColor? get clotheColorEnum =>
      ClotheColor.values.where((e) => e.color == clotheColor).firstOrNull;

  /// Returns the [SkinColor] enum matching [skinColor], or `null`.
  SkinColor? get skinColorEnum =>
      SkinColor.values.where((e) => e.color == skinColor).firstOrNull;

  /// The background style of the avatar.
  AvatarStyle style;

  /// The hair or hat type.
  TopType topType;

  /// The accessories (glasses) type.
  AccessoriesType accessoriesType;

  /// The hair color.
  Color hairColor;

  /// The hat color.
  Color hatColor;

  /// The facial hair type.
  FacialHairType facialHairType;

  /// The facial hair color.
  Color facialHairColor;

  /// The clothing type.
  ClotheType clotheType;

  /// The clothing color.
  Color clotheColor;

  /// The graphic on a graphic shirt.
  GraphicType graphicType;

  /// The eye type.
  EyeType eyeType;

  /// The eyebrow type.
  EyebrowType eyebrowType;

  /// The mouth type.
  MouthType mouthType;

  /// The skin color.
  Color skinColor;

  /// Serialises this avatar to a JSON-compatible map.
  Map<String, dynamic> toJson() {
    return {
      'style': style.name,
      'topType': topType.name,
      'accessoriesType': accessoriesType.name,
      'hairColor': _colorToHex(hairColor),
      'hatColor': _colorToHex(hatColor),
      'facialHairType': facialHairType.name,
      'facialHairColor': _colorToHex(facialHairColor),
      'clotheType': clotheType.name,
      'clotheColor': _colorToHex(clotheColor),
      'graphicType': graphicType.name,
      'eyeType': eyeType.name,
      'eyebrowType': eyebrowType.name,
      'mouthType': mouthType.name,
      'skinColor': _colorToHex(skinColor),
    };
  }

  /// Renders the avatar into an SVG string.
  ///
  /// Loads required SVG asset fragments asynchronously via the provided
  /// [cache] (or a default if null).
  /// If [colorMapped] is true (the default), color placeholders are replaced
  /// with the avatar's configured colors. If false, the raw SVG is returned
  /// with sentinel hex values untouched (useful if providing a custom
  /// ColorMapper).
  Future<String> toSvg({SvgCache? cache, bool colorMapped = true}) async {
    var svgStr = await buildAvatarSvg(
      cache: cache,
      style: style,
      topType: topType,
      accessoriesType: accessoriesType,
      facialHairType: facialHairType,
      clotheType: clotheType,
      graphicType: graphicType,
      eyeType: eyeType,
      eyebrowType: eyebrowType,
      mouthType: mouthType,
    );

    if (!svgStr.contains('xmlns="http://www.w3.org/2000/svg"')) {
      svgStr = svgStr.replaceFirst(
        '<svg',
        '<svg xmlns="http://www.w3.org/2000/svg"',
      );
    }

    if (!colorMapped) return svgStr;

    final mapper = AvatarColorMapper(
      skinColor: skinColor,
      hairColor: hairColor,
      hatColor: hatColor,
      clotheColor: clotheColor,
      facialHairColor: facialHairColor,
    );

    return mapper.applyToString(svgStr);
  }

  /// Creates a copy with the given fields replaced.
  Avataaar copyWith({
    AvatarStyle? style,
    TopType? topType,
    AccessoriesType? accessoriesType,
    Color? hairColor,
    Color? hatColor,
    FacialHairType? facialHairType,
    Color? facialHairColor,
    ClotheType? clotheType,
    Color? clotheColor,
    GraphicType? graphicType,
    EyeType? eyeType,
    EyebrowType? eyebrowType,
    MouthType? mouthType,
    Color? skinColor,
  }) {
    return Avataaar(
      style: style ?? this.style,
      topType: topType ?? this.topType,
      accessoriesType: accessoriesType ?? this.accessoriesType,
      hairColor: hairColor ?? this.hairColor,
      hatColor: hatColor ?? this.hatColor,
      facialHairType: facialHairType ?? this.facialHairType,
      facialHairColor: facialHairColor ?? this.facialHairColor,
      clotheType: clotheType ?? this.clotheType,
      clotheColor: clotheColor ?? this.clotheColor,
      graphicType: graphicType ?? this.graphicType,
      eyeType: eyeType ?? this.eyeType,
      eyebrowType: eyebrowType ?? this.eyebrowType,
      mouthType: mouthType ?? this.mouthType,
      skinColor: skinColor ?? this.skinColor,
    );
  }

  static String _colorToHex(Color c) {
    return '#${(c.r * 255).round().toRadixString(16).padLeft(2, '0')}'
        '${(c.g * 255).round().toRadixString(16).padLeft(2, '0')}'
        '${(c.b * 255).round().toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  static Color _hexToColor(String hex) {
    final value = int.parse(hex.substring(1), radix: 16);
    return Color(0xFF000000 | value);
  }
}
