#!/usr/bin/env python3
"""Generate Dart SVG builder from extracted SVG fragments JSON.

Prerequisites:
  Run extract_svg_fragments.js first to produce tools/svg_fragments.json.

Usage (from flutter_avataaars/):
  python3 tools/generate_svg_data.py
"""
import json
import os
import sys

script_dir = os.path.dirname(os.path.abspath(__file__))
json_path = os.path.join(script_dir, 'svg_fragments.json')
output_path = os.path.join(script_dir, '..', 'lib', 'svg', 'svg_data.dart')

with open(json_path, 'r') as f:
    data = json.load(f)

def dart_string(s):
    """Escape a string for a Dart single-quoted string literal."""
    if not s:
        return "''"
    escaped = s.replace('\\', '\\\\').replace("'", "\\'").replace('$', '\\$')
    return "'" + escaped + "'"

# Mapping from avataaars variant names to Dart enum value names
ENUM_MAP = {
    'eyes': {
        'Close': 'close', 'Cry': 'cry', 'Default': 'defaultEye',
        'Dizzy': 'dizzy', 'EyeRoll': 'eyeRoll', 'Happy': 'happy',
        'Hearts': 'hearts', 'Side': 'side', 'Squint': 'squint',
        'Surprised': 'surprised', 'Wink': 'wink', 'WinkWacky': 'winkWacky',
    },
    'eyebrows': {
        'Angry': 'angry', 'AngryNatural': 'angryNatural', 'Default': 'defaultBrow',
        'DefaultNatural': 'defaultNatural', 'FlatNatural': 'flatNatural',
        'FrownNatural': 'frownNatural', 'RaisedExcited': 'raisedExcited',
        'RaisedExcitedNatural': 'raisedExcitedNatural', 'SadConcerned': 'sadConcerned',
        'SadConcernedNatural': 'sadConcernedNatural', 'UnibrowNatural': 'unibrowNatural',
        'UpDown': 'upDown', 'UpDownNatural': 'upDownNatural',
    },
    'mouths': {
        'Concerned': 'concerned', 'Default': 'defaultMouth', 'Disbelief': 'disbelief',
        'Eating': 'eating', 'Grimace': 'grimace', 'Sad': 'sad',
        'ScreamOpen': 'screamOpen', 'Serious': 'serious', 'Smile': 'smile',
        'Tongue': 'tongue', 'Twinkle': 'twinkle', 'Vomit': 'vomit',
    },
    'clothing': {
        'BlazerShirt': 'blazerShirt', 'BlazerSweater': 'blazerSweater',
        'CollarSweater': 'collarSweater', 'GraphicShirt': 'graphicShirt',
        'Hoodie': 'hoodie', 'Overall': 'overall', 'ShirtCrewNeck': 'shirtCrewNeck',
        'ShirtScoopNeck': 'shirtScoopNeck', 'ShirtVNeck': 'shirtVNeck',
    },
    'top': {
        'NoHair': 'noHair', 'Eyepatch': 'eyepatch', 'Hat': 'hat',
        'Hijab': 'hijab', 'Turban': 'turban', 'WinterHat1': 'winterHat1',
        'WinterHat2': 'winterHat2', 'WinterHat3': 'winterHat3',
        'WinterHat4': 'winterHat4', 'LongHairBigHair': 'longHairBigHair',
        'LongHairBob': 'longHairBob', 'LongHairBun': 'longHairBun',
        'LongHairCurly': 'longHairCurly', 'LongHairCurvy': 'longHairCurvy',
        'LongHairDreads': 'longHairDreads', 'LongHairFrida': 'longHairFrida',
        'LongHairFro': 'longHairFro', 'LongHairFroBand': 'longHairFroBand',
        'LongHairMiaWallace': 'longHairMiaWallace',
        'LongHairNotTooLong': 'longHairNotTooLong',
        'LongHairShavedSides': 'longHairShavedSides',
        'LongHairStraight': 'longHairStraight',
        'LongHairStraight2': 'longHairStraight2',
        'LongHairStraightStrand': 'longHairStraightStrand',
        'ShortHairDreads01': 'shortHairDreads01',
        'ShortHairDreads02': 'shortHairDreads02',
        'ShortHairFrizzle': 'shortHairFrizzle',
        'ShortHairShaggyMullet': 'shortHairShaggyMullet',
        'ShortHairShortCurly': 'shortHairShortCurly',
        'ShortHairShortFlat': 'shortHairShortFlat',
        'ShortHairShortRound': 'shortHairShortRound',
        'ShortHairShortWaved': 'shortHairShortWaved',
        'ShortHairSides': 'shortHairSides',
        'ShortHairTheCaesar': 'shortHairTheCaesar',
        'ShortHairTheCaesarSidePart': 'shortHairTheCaesarSidePart',
        'ShortHairShaggy': 'shortHairShaggy',
    },
    'accessories': {
        'Blank': 'blank', 'Kurt': 'kurt', 'Prescription01': 'prescription01',
        'Prescription02': 'prescription02', 'Round': 'round',
        'Sunglasses': 'sunglasses', 'Wayfarers': 'wayfarers',
    },
    'facialHair': {
        'Blank': 'blank', 'BeardMedium': 'beardMedium', 'BeardLight': 'beardLight',
        'BeardMajestic': 'beardMajestic', 'MoustacheFancy': 'moustacheFancy',
        'MoustacheMagnum': 'moustacheMagnum',
    },
    'graphicClothing': {
        'Bat': 'bat', 'Cumbia': 'cumbia', 'Deer': 'deer',
        'Diamond': 'diamond', 'Hola': 'hola', 'Pizza': 'pizza',
        'Resist': 'resist', 'Selena': 'selena', 'Bear': 'bear',
        'SkullOutline': 'skullOutline', 'Skull': 'skull',
    },
}

lines = []

# Header
lines.append("// GENERATED FILE - DO NOT EDIT")
lines.append("// Generated from avataaars SVG components via React SSR extraction.")
lines.append("")
lines.append("import '../models/avatar_style.dart';")
lines.append("")

# Shared defs
lines.append(f"const String _sharedDefs = {dart_string(data['sharedDefs'])};")
lines.append("")

# Body
lines.append(f"const String _bodyGroup = {dart_string(data['body'])};")
lines.append("")

# Nose
lines.append(f"const String _noseGroup = {dart_string(data['nose'])};")
lines.append("")

# Helper: generate switch function
def gen_switch(func_name, return_type, enum_type, category, data_map, fallbacks=None):
    lines.append(f"{return_type} {func_name}({enum_type} type) {{")
    lines.append("  switch (type) {")
    for name, svg in data_map.items():
        enum_name = ENUM_MAP[category].get(name)
        if enum_name is None:
            continue
        lines.append(f"    case {enum_type}.{enum_name}:")
        lines.append(f"      return {dart_string(svg)};")
    # Add fallbacks for missing variants
    if fallbacks:
        for enum_name, fallback_svg in fallbacks.items():
            lines.append(f"    case {enum_type}.{enum_name}:")
            lines.append(f"      return {dart_string(fallback_svg)};")
    lines.append("  }")
    lines.append("}")
    lines.append("")

# Eye function
gen_switch("getEyeSvg", "String", "EyeType", "eyes", data['eyes'])

# Eyebrow function (with FrownNatural fallback)
eyebrow_fallbacks = {}
if 'FrownNatural' not in data['eyebrows']:
    eyebrow_fallbacks['frownNatural'] = data['eyebrows'].get('Default', '')
gen_switch("getEyebrowSvg", "String", "EyebrowType", "eyebrows", data['eyebrows'], eyebrow_fallbacks)

# Mouth function
gen_switch("getMouthSvg", "String", "MouthType", "mouths", data['mouths'])

# Clothing function (handles GraphicShirt specially)
lines.append("String getClothingSvg(ClotheType type, GraphicType graphicType) {")
lines.append("  if (type == ClotheType.graphicShirt) {")
lines.append("    return _getGraphicShirtSvg(graphicType);")
lines.append("  }")
lines.append("  switch (type) {")
for name, svg in data['clothing'].items():
    enum_name = ENUM_MAP['clothing'].get(name)
    if enum_name is None:
        continue
    lines.append(f"    case ClotheType.{enum_name}:")
    lines.append(f"      return {dart_string(svg)};")
lines.append("  }")
lines.append("}")
lines.append("")

# Graphic shirt function
lines.append("String _getGraphicShirtSvg(GraphicType graphicType) {")
lines.append("  switch (graphicType) {")
for name, svg in data.get('graphicClothing', {}).items():
    enum_name = ENUM_MAP['graphicClothing'].get(name)
    if enum_name is None:
        continue
    lines.append(f"    case GraphicType.{enum_name}:")
    lines.append(f"      return {dart_string(svg)};")
lines.append("  }")
lines.append("}")
lines.append("")

# Top function (with ShortHairShaggy fallback)
top_fallbacks = {}
if 'ShortHairShaggy' not in data['top']:
    top_fallbacks['shortHairShaggy'] = data['top'].get('ShortHairShaggyMullet', '')
gen_switch("getTopSvg", "String", "TopType", "top", data['top'], top_fallbacks)

# Accessory function
gen_switch("getAccessorySvg", "String", "AccessoriesType", "accessories", data['accessories'])

# Facial hair function
gen_switch("getFacialHairSvg", "String", "FacialHairType", "facialHair", data['facialHair'])

# Color lookup functions
def gen_color_func(func_name, enum_type, color_map, dart_names):
    lines.append(f"String {func_name}({enum_type} color) {{")
    lines.append("  switch (color) {")
    for name, hex_val in color_map.items():
        dart_name = dart_names.get(name)
        if dart_name is None:
            continue
        lines.append(f"    case {enum_type}.{dart_name}:")
        lines.append(f"      return '{hex_val}';")
    lines.append("  }")
    lines.append("}")
    lines.append("")

gen_color_func("getSkinColorHex", "SkinColor", data['skinColorMap'],
    {'Tanned': 'tanned', 'Yellow': 'yellow', 'Pale': 'pale', 'Light': 'light', 'Brown': 'brown', 'DarkBrown': 'darkBrown', 'Black': 'black'})

# Hair color: map avataaars names to Flutter enum names (with correct hex values)
hair_color_dart = {
    'auburn': '#A55728', 'black': '#2C1B18', 'blonde': '#B58143',
    'blondeGolden': '#D6B370', 'brown': '#724133', 'brownDark': '#4A312C',
    'pastelPink': '#F59797', 'blue': '#000FDB', 'platinum': '#ECDCBF',
    'red': '#C93305', 'silverGray': '#E8E1E1',
}
lines.append("String getHairColorHex(HairColor color) {")
lines.append("  switch (color) {")
for dart_name, hex_val in hair_color_dart.items():
    lines.append(f"    case HairColor.{dart_name}:")
    lines.append(f"      return '{hex_val}';")
lines.append("  }")
lines.append("}")
lines.append("")

gen_color_func("getClotheColorHex", "ClotheColor", data['clotheColorMap'],
    {'Black': 'black', 'Blue01': 'blue01', 'Blue02': 'blue02', 'Blue03': 'blue03', 'Gray01': 'gray01', 'Gray02': 'gray02', 'Heather': 'heather', 'PastelBlue': 'pastelBlue', 'PastelGreen': 'pastelGreen', 'PastelOrange': 'pastelOrange', 'PastelRed': 'pastelRed', 'PastelYellow': 'pastelYellow', 'Pink': 'pink', 'Red': 'red', 'White': 'white'})

gen_color_func("getHatColorHex", "HatColor", data.get('hatColorMap', data['clotheColorMap']),
    {'Black': 'black', 'Blue01': 'blue01', 'Blue02': 'blue02', 'Blue03': 'blue03', 'Gray01': 'gray01', 'Gray02': 'gray02', 'Heather': 'heather', 'PastelBlue': 'pastelBlue', 'PastelGreen': 'pastelGreen', 'PastelOrange': 'pastelOrange', 'PastelRed': 'pastelRed', 'PastelYellow': 'pastelYellow', 'Pink': 'pink', 'Red': 'red', 'White': 'white'})

# Facial hair color uses same hex values as hair color, but with fewer options
fh_color_map = {}
for name in ['Auburn', 'Black', 'Blonde', 'BlondeGolden', 'Brown', 'BrownDark', 'Platinum', 'Red']:
    fh_color_map[name] = data['hairColorMap'].get(name, '#000000')
gen_color_func("getFacialHairColorHex", "FacialHairColor", fh_color_map,
    {'Auburn': 'auburn', 'Black': 'black', 'Blonde': 'blonde', 'BlondeGolden': 'blondeGolden', 'Brown': 'brown', 'BrownDark': 'brownDark', 'Platinum': 'platinum', 'Red': 'red'})

# Main builder function - uses actual Dart string interpolation ($)
lines.append("/// Build a complete avatar SVG string from avatar attributes.")
lines.append("String buildAvatarSvg({")
lines.append("  required TopType topType,")
lines.append("  required AccessoriesType accessoriesType,")
lines.append("  required HairColor hairColor,")
lines.append("  required HatColor hatColor,")
lines.append("  required FacialHairType facialHairType,")
lines.append("  required FacialHairColor facialHairColor,")
lines.append("  required ClotheType clotheType,")
lines.append("  required ClotheColor clotheColor,")
lines.append("  required GraphicType graphicType,")
lines.append("  required EyeType eyeType,")
lines.append("  required EyebrowType eyebrowType,")
lines.append("  required MouthType mouthType,")
lines.append("  required SkinColor skinColor,")
lines.append("}) {")
lines.append("  final skinHex = getSkinColorHex(skinColor);")
lines.append("  final hairHex = getHairColorHex(hairColor);")
lines.append("  final hatHex = getHatColorHex(hatColor);")
lines.append("  final clotheHex = getClotheColorHex(clotheColor);")
lines.append("  final facialHairHex = getFacialHairColorHex(facialHairColor);")
lines.append("")
lines.append("  final eyeSvg = getEyeSvg(eyeType);")
lines.append("  final eyebrowSvg = getEyebrowSvg(eyebrowType);")
lines.append("  final mouthSvg = getMouthSvg(mouthType);")
lines.append("  var clothingSvg = getClothingSvg(clotheType, graphicType)")
lines.append("      .replaceAll('{{CLOTHE_COLOR}}', clotheHex);")
lines.append("")
lines.append("  var topSvg = getTopSvg(topType)")
lines.append("      .replaceAll('{{HAIR_COLOR}}', hairHex)")
lines.append("      .replaceAll('{{HAT_COLOR}}', hatHex)")
lines.append("      .replaceAll('{{SKIN_COLOR}}', skinHex);")
lines.append("  final accSvg = getAccessorySvg(accessoriesType);")
lines.append("  var fhSvg = getFacialHairSvg(facialHairType)")
lines.append("      .replaceAll('{{FACIAL_HAIR_COLOR}}', facialHairHex);")
lines.append("")
lines.append("  // Insert accessories and facial hair before the last </g> of top")
lines.append("  if (accSvg.isNotEmpty || fhSvg.isNotEmpty) {")
lines.append("    final lastClose = topSvg.lastIndexOf('</g>');")
lines.append("    if (lastClose >= 0) {")
lines.append("      topSvg = '${topSvg.substring(0, lastClose)}$accSvg$fhSvg${topSvg.substring(lastClose)}';")
lines.append("    }")
lines.append("  }")
lines.append("")
lines.append("  final bodySvg = _bodyGroup.replaceAll('{{SKIN_COLOR}}', skinHex);")
lines.append("")
lines.append("  return '<svg viewBox=\"0 0 264 280\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">'")
lines.append("    '<defs>$_sharedDefs</defs>'")
lines.append("    '<g id=\"Avataaar\" stroke=\"none\" stroke-width=\"1\" fill=\"none\" fill-rule=\"evenodd\">'")
lines.append("    '<g transform=\"translate(0, 0)\">'")
lines.append("    '<g transform=\"translate(12, 40)\">'")
lines.append("    '<mask id=\"mask-bg\" fill=\"white\"><use xlink:href=\"#shared-path-1\"/></mask>'")
lines.append("    '<use fill=\"#E6E6E6\" xlink:href=\"#shared-path-1\"/>'")
lines.append("    '<g mask=\"url(#mask-bg)\" fill=\"#65C9FF\"><rect x=\"0\" y=\"0\" width=\"240\" height=\"240\"/></g>'")
lines.append("    '</g>'")
lines.append("    '<mask id=\"mask-clip\" fill=\"white\"><use xlink:href=\"#shared-path-2\"/></mask>'")
lines.append("    '<g mask=\"url(#mask-clip)\">'")
lines.append("    '$bodySvg'")
lines.append("    '$clothingSvg'")
lines.append("    '<g transform=\"translate(76, 82)\" fill=\"#000000\">'")
lines.append("    '$mouthSvg'")
lines.append("    '$_noseGroup'")
lines.append("    '$eyeSvg'")
lines.append("    '$eyebrowSvg'")
lines.append("    '</g>'")
lines.append("    '$topSvg'")
lines.append("    '</g>'")
lines.append("    '</g>'")
lines.append("    '</g>'")
lines.append("    '</svg>';")
lines.append("}")

output = '\n'.join(lines)
with open(output_path, 'w') as f:
    f.write(output)

print(f"Generated {output_path} ({len(output)} bytes, {len(lines)} lines)")
