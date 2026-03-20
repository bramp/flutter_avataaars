import 'package:flutter_avataaars/src/models/avatar_style.dart';
import 'package:flutter_avataaars/src/svg/svg_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Sentinel colors: the marker colors baked into SVG fragments
// during extraction.
//
// These are the hex values produced by rendering avataaars with known color
// options (DarkBrown skin, SilverGray hair, Red hat, Pink clothe, Auburn facial
// hair). At render time the ColorMapper substitutes the user's actual colors.
// Must match the markers in extract_svg_fragments.js.
const Color _skinSentinel = Color(0xFFAE5D29); // DarkBrown
const Color _hairSentinel = Color(0xFFE8E1E1); // SilverGray
const Color _hairShadowSentinel = Color(0xFFCCB55A); // LongHairShavedSides body
const Color _hatSentinel = Color(0xFFFF5C5C); // Red
const Color _clotheSentinel = Color(0xFFFF488E); // Pink
const Color _facialHairSentinel = Color(0xFFA55728); // Auburn

/// Maps sentinel colors in SVG data to actual avatar colors at parse time.
///
/// Used with [SvgStringLoader] to avoid string-level color replacement.
/// The SVG fragments contain the sentinel hex values (#AE5D29, #E8E1E1,
/// #FF5C5C, #FF488E, #A55728) for skin, hair, hat, clothing, and facial
/// hair colors. This mapper substitutes the real colors when the SVG is
/// parsed.
@immutable
class AvatarColorMapper extends ColorMapper {
  /// Creates a mapper that substitutes sentinel colors with the given values.
  const AvatarColorMapper({
    required this.skinColor,
    required this.hairColor,
    required this.hatColor,
    required this.clotheColor,
    required this.facialHairColor,
  });

  /// Creates a mapper from avatar style enums.
  factory AvatarColorMapper.fromEnums({
    required SkinColor skinColor,
    required HairColor hairColor,
    required HatColor hatColor,
    required ClotheColor clotheColor,
    required FacialHairColor facialHairColor,
  }) {
    return AvatarColorMapper(
      skinColor: _parseHex(getSkinColorHex(skinColor)),
      hairColor: _parseHex(getHairColorHex(hairColor)),
      hatColor: _parseHex(getHatColorHex(hatColor)),
      clotheColor: _parseHex(getClotheColorHex(clotheColor)),
      facialHairColor: _parseHex(getFacialHairColorHex(facialHairColor)),
    );
  }

  /// Applies this color mapping directly to an SVG string.
  ///
  /// This performs string replacements substituting the sentinel hex values
  /// with the configured colors.
  String applyToString(String svg) {
    String toHex(Color c) {
      return '#${(c.r * 255).round().toRadixString(16).padLeft(2, '0')}'
          '${(c.g * 255).round().toRadixString(16).padLeft(2, '0')}'
          '${(c.b * 255).round().toRadixString(16).padLeft(2, '0')}'
          .toUpperCase();
    }

    final replacements = <String, String>{
      toHex(_skinSentinel).toLowerCase(): toHex(skinColor),
      toHex(_hairSentinel).toLowerCase(): toHex(hairColor),
      toHex(_hairShadowSentinel).toLowerCase(): toHex(_darken(hairColor, 0.20)),
      toHex(_hatSentinel).toLowerCase(): toHex(hatColor),
      toHex(_clotheSentinel).toLowerCase(): toHex(clotheColor),
      toHex(_facialHairSentinel).toLowerCase(): toHex(facialHairColor),
    };

    final pattern = replacements.keys.join('|');
    final regex = RegExp(pattern, caseSensitive: false);

    return svg.replaceAllMapped(regex, (match) {
      final key = match.group(0)!.toLowerCase();
      return replacements[key] ?? match.group(0)!;
    });
  }

  /// The color to substitute for skin sentinel.
  final Color skinColor;

  /// The color to substitute for hair sentinel.
  final Color hairColor;

  /// The color to substitute for hat sentinel.
  final Color hatColor;

  /// The color to substitute for clothing sentinel.
  final Color clotheColor;

  /// The color to substitute for facial hair sentinel.
  final Color facialHairColor;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (color == _skinSentinel) return skinColor;
    if (color == _hairSentinel) return hairColor;
    if (color == _hairShadowSentinel) return _darken(hairColor, 0.20);
    if (color == _hatSentinel) return hatColor;
    if (color == _clotheSentinel) return clotheColor;
    if (color == _facialHairSentinel) return facialHairColor;
    return color;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvatarColorMapper &&
          skinColor == other.skinColor &&
          hairColor == other.hairColor &&
          hatColor == other.hatColor &&
          clotheColor == other.clotheColor &&
          facialHairColor == other.facialHairColor;

  @override
  int get hashCode => Object.hash(
    skinColor,
    hairColor,
    hatColor,
    clotheColor,
    facialHairColor,
  );

  /// Darkens a color by reducing its RGB components by [amount] (0.0–1.0).
  static Color _darken(Color color, double amount) {
    final r = (color.r * (1 - amount)).clamp(0.0, 1.0);
    final g = (color.g * (1 - amount)).clamp(0.0, 1.0);
    final b = (color.b * (1 - amount)).clamp(0.0, 1.0);
    return Color.from(alpha: color.a, red: r, green: g, blue: b);
  }

  static Color _parseHex(String hex) {
    final value = int.parse(hex.substring(1), radix: 16);
    return Color(0xFF000000 | value);
  }
}
