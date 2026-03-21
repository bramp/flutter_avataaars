// GENERATED FILE - DO NOT EDIT
// Generated from avataaars SVG components via React SSR extraction.
// SVG fragments are stored as asset files under lib/assets/.

import 'package:avatar_builder/src/models/avatar_style.dart';
import 'package:avatar_builder/src/svg/svg_cache.dart';

// Sentinel hex values baked into SVG fragments during extraction.
// These are the colors produced by rendering avataaars with specific options
// (DarkBrown skin, SilverGray hair, Red hat, Pink clothe, Auburn facial hair).
// At runtime, AvatarColorMapper substitutes the user's actual colors.
const String sentinelSkin = '#ae5d29';
const String sentinelHair = '#e8e1e1';
const String sentinelHairShadow = '#ccb55a';
const String sentinelHat = '#ff5c5c';
const String sentinelClothe = '#ff488e';
const String sentinelFacialHair = '#a55728';

const String _assetPrefix = 'packages/avataaars/lib/assets';

String _eyeAsset(EyeType type) {
  switch (type) {
    case EyeType.close:
      return '$_assetPrefix/eyes/close.svgf';
    case EyeType.cry:
      return '$_assetPrefix/eyes/cry.svgf';
    case EyeType.defaultEye:
      return '$_assetPrefix/eyes/default_eye.svgf';
    case EyeType.dizzy:
      return '$_assetPrefix/eyes/dizzy.svgf';
    case EyeType.eyeRoll:
      return '$_assetPrefix/eyes/eye_roll.svgf';
    case EyeType.happy:
      return '$_assetPrefix/eyes/happy.svgf';
    case EyeType.hearts:
      return '$_assetPrefix/eyes/hearts.svgf';
    case EyeType.side:
      return '$_assetPrefix/eyes/side.svgf';
    case EyeType.squint:
      return '$_assetPrefix/eyes/squint.svgf';
    case EyeType.surprised:
      return '$_assetPrefix/eyes/surprised.svgf';
    case EyeType.wink:
      return '$_assetPrefix/eyes/wink.svgf';
    case EyeType.winkWacky:
      return '$_assetPrefix/eyes/wink_wacky.svgf';
  }
}

String _eyebrowAsset(EyebrowType type) {
  switch (type) {
    case EyebrowType.angry:
      return '$_assetPrefix/eyebrows/angry.svgf';
    case EyebrowType.angryNatural:
      return '$_assetPrefix/eyebrows/angry_natural.svgf';
    case EyebrowType.defaultBrow:
      return '$_assetPrefix/eyebrows/default_brow.svgf';
    case EyebrowType.defaultNatural:
      return '$_assetPrefix/eyebrows/default_natural.svgf';
    case EyebrowType.flatNatural:
      return '$_assetPrefix/eyebrows/flat_natural.svgf';
    case EyebrowType.raisedExcited:
      return '$_assetPrefix/eyebrows/raised_excited.svgf';
    case EyebrowType.raisedExcitedNatural:
      return '$_assetPrefix/eyebrows/raised_excited_natural.svgf';
    case EyebrowType.sadConcerned:
      return '$_assetPrefix/eyebrows/sad_concerned.svgf';
    case EyebrowType.sadConcernedNatural:
      return '$_assetPrefix/eyebrows/sad_concerned_natural.svgf';
    case EyebrowType.unibrowNatural:
      return '$_assetPrefix/eyebrows/unibrow_natural.svgf';
    case EyebrowType.upDown:
      return '$_assetPrefix/eyebrows/up_down.svgf';
    case EyebrowType.upDownNatural:
      return '$_assetPrefix/eyebrows/up_down_natural.svgf';
    case EyebrowType.frownNatural:
      return '$_assetPrefix/eyebrows/frown_natural.svgf';
  }
}

String _mouthAsset(MouthType type) {
  switch (type) {
    case MouthType.concerned:
      return '$_assetPrefix/mouths/concerned.svgf';
    case MouthType.defaultMouth:
      return '$_assetPrefix/mouths/default_mouth.svgf';
    case MouthType.disbelief:
      return '$_assetPrefix/mouths/disbelief.svgf';
    case MouthType.eating:
      return '$_assetPrefix/mouths/eating.svgf';
    case MouthType.grimace:
      return '$_assetPrefix/mouths/grimace.svgf';
    case MouthType.sad:
      return '$_assetPrefix/mouths/sad.svgf';
    case MouthType.screamOpen:
      return '$_assetPrefix/mouths/scream_open.svgf';
    case MouthType.serious:
      return '$_assetPrefix/mouths/serious.svgf';
    case MouthType.smile:
      return '$_assetPrefix/mouths/smile.svgf';
    case MouthType.tongue:
      return '$_assetPrefix/mouths/tongue.svgf';
    case MouthType.twinkle:
      return '$_assetPrefix/mouths/twinkle.svgf';
    case MouthType.vomit:
      return '$_assetPrefix/mouths/vomit.svgf';
  }
}

String _clothingAsset(ClotheType type) {
  switch (type) {
    case ClotheType.blazerShirt:
      return '$_assetPrefix/clothing/blazer_shirt.svgf';
    case ClotheType.blazerSweater:
      return '$_assetPrefix/clothing/blazer_sweater.svgf';
    case ClotheType.collarSweater:
      return '$_assetPrefix/clothing/collar_sweater.svgf';
    case ClotheType.graphicShirt:
      return '$_assetPrefix/clothing/graphic_shirt.svgf';
    case ClotheType.hoodie:
      return '$_assetPrefix/clothing/hoodie.svgf';
    case ClotheType.overall:
      return '$_assetPrefix/clothing/overall.svgf';
    case ClotheType.shirtCrewNeck:
      return '$_assetPrefix/clothing/shirt_crew_neck.svgf';
    case ClotheType.shirtScoopNeck:
      return '$_assetPrefix/clothing/shirt_scoop_neck.svgf';
    case ClotheType.shirtVNeck:
      return '$_assetPrefix/clothing/shirt_v_neck.svgf';
  }
}

String _topAsset(TopType type) {
  switch (type) {
    case TopType.noHair:
      return '$_assetPrefix/top/no_hair.svgf';
    case TopType.eyepatch:
      return '$_assetPrefix/top/eyepatch.svgf';
    case TopType.hat:
      return '$_assetPrefix/top/hat.svgf';
    case TopType.hijab:
      return '$_assetPrefix/top/hijab.svgf';
    case TopType.turban:
      return '$_assetPrefix/top/turban.svgf';
    case TopType.winterHat1:
      return '$_assetPrefix/top/winter_hat1.svgf';
    case TopType.winterHat2:
      return '$_assetPrefix/top/winter_hat2.svgf';
    case TopType.winterHat3:
      return '$_assetPrefix/top/winter_hat3.svgf';
    case TopType.winterHat4:
      return '$_assetPrefix/top/winter_hat4.svgf';
    case TopType.longHairBigHair:
      return '$_assetPrefix/top/long_hair_big_hair.svgf';
    case TopType.longHairBob:
      return '$_assetPrefix/top/long_hair_bob.svgf';
    case TopType.longHairBun:
      return '$_assetPrefix/top/long_hair_bun.svgf';
    case TopType.longHairCurly:
      return '$_assetPrefix/top/long_hair_curly.svgf';
    case TopType.longHairCurvy:
      return '$_assetPrefix/top/long_hair_curvy.svgf';
    case TopType.longHairDreads:
      return '$_assetPrefix/top/long_hair_dreads.svgf';
    case TopType.longHairFrida:
      return '$_assetPrefix/top/long_hair_frida.svgf';
    case TopType.longHairFro:
      return '$_assetPrefix/top/long_hair_fro.svgf';
    case TopType.longHairFroBand:
      return '$_assetPrefix/top/long_hair_fro_band.svgf';
    case TopType.longHairMiaWallace:
      return '$_assetPrefix/top/long_hair_mia_wallace.svgf';
    case TopType.longHairNotTooLong:
      return '$_assetPrefix/top/long_hair_not_too_long.svgf';
    case TopType.longHairShavedSides:
      return '$_assetPrefix/top/long_hair_shaved_sides.svgf';
    case TopType.longHairStraight:
      return '$_assetPrefix/top/long_hair_straight.svgf';
    case TopType.longHairStraight2:
      return '$_assetPrefix/top/long_hair_straight2.svgf';
    case TopType.longHairStraightStrand:
      return '$_assetPrefix/top/long_hair_straight_strand.svgf';
    case TopType.shortHairDreads01:
      return '$_assetPrefix/top/short_hair_dreads01.svgf';
    case TopType.shortHairDreads02:
      return '$_assetPrefix/top/short_hair_dreads02.svgf';
    case TopType.shortHairFrizzle:
      return '$_assetPrefix/top/short_hair_frizzle.svgf';
    case TopType.shortHairShaggyMullet:
      return '$_assetPrefix/top/short_hair_shaggy_mullet.svgf';
    case TopType.shortHairShortCurly:
      return '$_assetPrefix/top/short_hair_short_curly.svgf';
    case TopType.shortHairShortFlat:
      return '$_assetPrefix/top/short_hair_short_flat.svgf';
    case TopType.shortHairShortRound:
      return '$_assetPrefix/top/short_hair_short_round.svgf';
    case TopType.shortHairShortWaved:
      return '$_assetPrefix/top/short_hair_short_waved.svgf';
    case TopType.shortHairSides:
      return '$_assetPrefix/top/short_hair_sides.svgf';
    case TopType.shortHairTheCaesar:
      return '$_assetPrefix/top/short_hair_the_caesar.svgf';
    case TopType.shortHairTheCaesarSidePart:
      return '$_assetPrefix/top/short_hair_the_caesar_side_part.svgf';
    case TopType.shortHairShaggy:
      return '$_assetPrefix/top/short_hair_shaggy.svgf';
  }
}

String _accessoryAsset(AccessoriesType type) {
  switch (type) {
    case AccessoriesType.blank:
      return '';
    case AccessoriesType.kurt:
      return '$_assetPrefix/accessories/kurt.svgf';
    case AccessoriesType.prescription01:
      return '$_assetPrefix/accessories/prescription01.svgf';
    case AccessoriesType.prescription02:
      return '$_assetPrefix/accessories/prescription02.svgf';
    case AccessoriesType.round:
      return '$_assetPrefix/accessories/round.svgf';
    case AccessoriesType.sunglasses:
      return '$_assetPrefix/accessories/sunglasses.svgf';
    case AccessoriesType.wayfarers:
      return '$_assetPrefix/accessories/wayfarers.svgf';
  }
}

String _facialHairAsset(FacialHairType type) {
  switch (type) {
    case FacialHairType.blank:
      return '';
    case FacialHairType.beardMedium:
      return '$_assetPrefix/facial_hair/beard_medium.svgf';
    case FacialHairType.beardLight:
      return '$_assetPrefix/facial_hair/beard_light.svgf';
    case FacialHairType.beardMajestic:
      return '$_assetPrefix/facial_hair/beard_majestic.svgf';
    case FacialHairType.moustacheFancy:
      return '$_assetPrefix/facial_hair/moustache_fancy.svgf';
    case FacialHairType.moustacheMagnum:
      return '$_assetPrefix/facial_hair/moustache_magnum.svgf';
  }
}

String _graphicClothingAsset(GraphicType type) {
  switch (type) {
    case GraphicType.bat:
      return '$_assetPrefix/graphic_clothing/bat.svgf';
    case GraphicType.cumbia:
      return '$_assetPrefix/graphic_clothing/cumbia.svgf';
    case GraphicType.deer:
      return '$_assetPrefix/graphic_clothing/deer.svgf';
    case GraphicType.diamond:
      return '$_assetPrefix/graphic_clothing/diamond.svgf';
    case GraphicType.hola:
      return '$_assetPrefix/graphic_clothing/hola.svgf';
    case GraphicType.pizza:
      return '$_assetPrefix/graphic_clothing/pizza.svgf';
    case GraphicType.resist:
      return '$_assetPrefix/graphic_clothing/resist.svgf';
    case GraphicType.selena:
      return '$_assetPrefix/graphic_clothing/selena.svgf';
    case GraphicType.bear:
      return '$_assetPrefix/graphic_clothing/bear.svgf';
    case GraphicType.skullOutline:
      return '$_assetPrefix/graphic_clothing/skull_outline.svgf';
    case GraphicType.skull:
      return '$_assetPrefix/graphic_clothing/skull.svgf';
  }
}

/// Build a complete avatar SVG string from cached asset fragments.
///
/// The returned SVG uses sentinel colors for skin, hair, hat, clothing,
/// and facial hair. Use [AvatarColorMapper] with [SvgStringLoader] to
/// substitute the actual colors at render time.
///
/// Assets are loaded on demand (and cached for future calls).
Future<String> buildAvatarSvg({
  SvgCache? cache,
  required AvatarStyle style,
  required TopType topType,
  required AccessoriesType accessoriesType,
  required FacialHairType facialHairType,
  required ClotheType clotheType,
  required GraphicType graphicType,
  required EyeType eyeType,
  required EyebrowType eyebrowType,
  required MouthType mouthType,
}) async {
  final c = cache ?? SvgCache.instance;
  final clothingPath = clotheType == ClotheType.graphicShirt
      ? _graphicClothingAsset(graphicType)
      : _clothingAsset(clotheType);
  final results = await Future.wait([
    c.load('$_assetPrefix/shared_defs.svgf'),
    c.load('$_assetPrefix/body.svgf'),
    c.load('$_assetPrefix/nose.svgf'),
    c.load(_eyeAsset(eyeType)),
    c.load(_eyebrowAsset(eyebrowType)),
    c.load(_mouthAsset(mouthType)),
    c.load(clothingPath),
    c.load(_topAsset(topType)),
    c.load(_accessoryAsset(accessoriesType)),
    c.load(_facialHairAsset(facialHairType)),
  ]);
  final sharedDefs = results[0];
  final bodyGroup = results[1];
  final noseGroup = results[2];
  final eyeSvg = results[3];
  final eyebrowSvg = results[4];
  final mouthSvg = results[5];
  final clothingSvg = results[6];
  var topSvg = results[7];
  final accSvg = results[8];
  final fhSvg = results[9];

  // Insert accessories and facial hair before the last </g> of top
  if (accSvg.isNotEmpty || fhSvg.isNotEmpty) {
    final lastClose = topSvg.lastIndexOf('</g>');
    if (lastClose >= 0) {
      topSvg = '${topSvg.substring(0, lastClose)}$accSvg$fhSvg${topSvg.substring(lastClose)}';
    }
  }

  final circle = style == AvatarStyle.circle;

  final circleBackground = circle
      ? '<g transform="translate(12, 40)">'
            '<mask id="mask-bg" fill="white"><use xlink:href="#shared-path-1"/></mask>'
            '<use fill="#E6E6E6" xlink:href="#shared-path-1"/>'
            '<g mask="url(#mask-bg)" fill="#65C9FF"><rect x="0" y="0" width="240" height="240"/></g>'
            '</g>'
      : '';

  final clipMask = circle
      ? '<mask id="mask-clip" fill="white"><use xlink:href="#shared-path-2"/></mask>'
      : '';

  final clipMaskRef = circle ? ' mask="url(#mask-clip)"' : '';

  return '<svg viewBox="0 0 264 280" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">'
    '<defs>$sharedDefs</defs>'
    '<g id="Avataaar" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">'
    '<g transform="translate(0, 0)">'
    '$circleBackground'
    '$clipMask'
    '<g$clipMaskRef>'
    '$bodyGroup'
    '$clothingSvg'
    '<g transform="translate(76, 82)" fill="#000000">'
    '$mouthSvg'
    '$noseGroup'
    '$eyeSvg'
    '$eyebrowSvg'
    '</g>'
    '$topSvg'
    '</g>'
    '</g>'
    '</g>'
    '</svg>';
}
