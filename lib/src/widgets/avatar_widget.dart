import 'package:avataaars/src/models/avataaar.dart';
import 'package:avataaars/src/svg/svg_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Renders an [Avataaar] using SVG.
class AvatarWidget extends StatelessWidget {
  /// Creates an [AvatarWidget] that renders the given [avatar].
  const AvatarWidget({
    required this.avatar,
    super.key,
    this.size = 264,
  });

  /// The avatar model to render.
  final Avataaar avatar;

  /// The width of the rendered avatar in logical pixels.
  final double size;

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
