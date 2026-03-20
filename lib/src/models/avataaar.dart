import 'dart:math';

import 'package:avatar_builder/src/models/avatar_style.dart';
import 'package:avatar_builder/src/svg/svg_cache.dart';
import 'package:avatar_builder/src/svg/svg_data.dart';
import 'package:avatar_builder/src/widgets/avatar_color_mapper.dart';

export 'package:avatar_builder/src/models/avatar_style.dart';

/// Holds the full set of selected avatar attributes.
// TODO(bramp): Add a json serialization method, so we can save/load these.
class Avataaar {
  /// Creates an avatar with the given attributes, using sensible defaults.
  Avataaar({
    this.style = AvatarStyle.circle,
    this.topType = TopType.longHairStraight,
    this.accessoriesType = AccessoriesType.blank,
    this.hairColor = HairColor.brownDark,
    this.hatColor = HatColor.gray01,
    this.facialHairType = FacialHairType.blank,
    this.facialHairColor = FacialHairColor.brownDark,
    this.clotheType = ClotheType.shirtCrewNeck,
    this.clotheColor = ClotheColor.gray01,
    this.graphicType = GraphicType.bat,
    this.eyeType = EyeType.defaultEye,
    this.eyebrowType = EyebrowType.defaultBrow,
    this.mouthType = MouthType.defaultMouth,
    this.skinColor = SkinColor.light,
  });

  /// Generate a completely random avatar.
  // TODO(bramp): Bais some of these picks.
  factory Avataaar.random([Random? rng]) {
    final r = rng ?? Random();
    T pick<T>(List<T> values) => values[r.nextInt(values.length)];
    return Avataaar(
      style: pick(AvatarStyle.values),
      topType: pick(TopType.values),
      accessoriesType: pick(AccessoriesType.values),
      hairColor: pick(HairColor.values),
      hatColor: pick(HatColor.values),
      facialHairType: pick(FacialHairType.values),
      facialHairColor: pick(FacialHairColor.values),
      clotheType: pick(ClotheType.values),
      clotheColor: pick(ClotheColor.values),
      graphicType: pick(GraphicType.values),
      eyeType: pick(EyeType.values),
      eyebrowType: pick(EyebrowType.values),
      mouthType: pick(MouthType.values),
      skinColor: pick(SkinColor.values),
    );
  }

  /// The background style of the avatar.
  AvatarStyle style;

  /// The hair or hat type.
  TopType topType;

  /// The accessories (glasses) type.
  AccessoriesType accessoriesType;

  /// The hair color.
  HairColor hairColor;

  /// The hat color.
  HatColor hatColor;

  /// The facial hair type.
  FacialHairType facialHairType;

  /// The facial hair color.
  FacialHairColor facialHairColor;

  /// The clothing type.
  ClotheType clotheType;

  /// The clothing color.
  ClotheColor clotheColor;

  /// The graphic on a graphic shirt.
  GraphicType graphicType;

  /// The eye type.
  EyeType eyeType;

  /// The eyebrow type.
  EyebrowType eyebrowType;

  /// The mouth type.
  MouthType mouthType;

  /// The skin color.
  SkinColor skinColor;

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

    final mapper = AvatarColorMapper.fromEnums(
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
    HairColor? hairColor,
    HatColor? hatColor,
    FacialHairType? facialHairType,
    FacialHairColor? facialHairColor,
    ClotheType? clotheType,
    ClotheColor? clotheColor,
    GraphicType? graphicType,
    EyeType? eyeType,
    EyebrowType? eyebrowType,
    MouthType? mouthType,
    SkinColor? skinColor,
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
}
