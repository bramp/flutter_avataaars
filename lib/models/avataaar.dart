import 'dart:math';
import 'avatar_style.dart';

export 'avatar_style.dart';

/// Holds the full set of selected avatar attributes.
class Avataaar {
  AvatarStyle style;
  TopType topType;
  AccessoriesType accessoriesType;
  HairColor hairColor;
  HatColor hatColor;
  FacialHairType facialHairType;
  FacialHairColor facialHairColor;
  ClotheType clotheType;
  ClotheColor clotheColor;
  GraphicType graphicType;
  EyeType eyeType;
  EyebrowType eyebrowType;
  MouthType mouthType;
  SkinColor skinColor;

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

  /// Generate a completely random avatar.
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
}
