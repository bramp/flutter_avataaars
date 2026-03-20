import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/avataaar.dart';
import '../svg/svg_data.dart';

/// Renders an Avataaar using SVG.
class AvatarWidget extends StatelessWidget {
  final Avataaar avatar;
  final double size;

  const AvatarWidget({
    super.key,
    required this.avatar,
    this.size = 264,
  });

  @override
  Widget build(BuildContext context) {
    final svgString = buildAvatarSvg(
      topType: avatar.topType,
      accessoriesType: avatar.accessoriesType,
      hairColor: avatar.hairColor,
      hatColor: avatar.hatColor,
      facialHairType: avatar.facialHairType,
      facialHairColor: avatar.facialHairColor,
      clotheType: avatar.clotheType,
      clotheColor: avatar.clotheColor,
      graphicType: avatar.graphicType,
      eyeType: avatar.eyeType,
      eyebrowType: avatar.eyebrowType,
      mouthType: avatar.mouthType,
      skinColor: avatar.skinColor,
    );
    return SizedBox(
      width: size,
      height: size * (280 / 264),
      child: SvgPicture.string(svgString),
    );
  }
}
