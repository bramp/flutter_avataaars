import 'dart:ui';

/// The background style of the avatar
enum AvatarStyle {
  circle('Circle'),
  transparent('Transparent');

  final String label;
  const AvatarStyle(this.label);
}

/// Top / hair type
enum TopType {
  noHair('No Hair'),
  eyepatch('Eyepatch'),
  hat('Hat'),
  hijab('Hijab'),
  turban('Turban'),
  winterHat1('Winter Hat 1'),
  winterHat2('Winter Hat 2'),
  winterHat3('Winter Hat 3'),
  winterHat4('Winter Hat 4'),
  longHairBigHair('Long Hair Big Hair'),
  longHairBob('Long Hair Bob'),
  longHairBun('Long Hair Bun'),
  longHairCurly('Long Hair Curly'),
  longHairCurvy('Long Hair Curvy'),
  longHairDreads('Long Hair Dreads'),
  longHairFrida('Long Hair Frida'),
  longHairFro('Long Hair Fro'),
  longHairFroBand('Long Hair Fro Band'),
  longHairMiaWallace('Long Hair Mia Wallace'),
  longHairNotTooLong('Long Hair Not Too Long'),
  longHairShavedSides('Long Hair Shaved Sides'),
  longHairStraight('Long Hair Straight'),
  longHairStraight2('Long Hair Straight 2'),
  longHairStraightStrand('Long Hair Straight Strand'),
  shortHairDreads01('Short Hair Dreads 01'),
  shortHairDreads02('Short Hair Dreads 02'),
  shortHairFrizzle('Short Hair Frizzle'),
  shortHairShaggy('Short Hair Shaggy'),
  shortHairShaggyMullet('Short Hair Shaggy Mullet'),
  shortHairShortCurly('Short Hair Short Curly'),
  shortHairShortFlat('Short Hair Short Flat'),
  shortHairShortRound('Short Hair Short Round'),
  shortHairShortWaved('Short Hair Short Waved'),
  shortHairSides('Short Hair Sides'),
  shortHairTheCaesar('Short Hair The Caesar'),
  shortHairTheCaesarSidePart('Short Hair The Caesar Side Part');

  final String label;
  const TopType(this.label);
}

/// Accessories / glasses type
enum AccessoriesType {
  blank('Blank'),
  kurt('Kurt'),
  prescription01('Prescription 01'),
  prescription02('Prescription 02'),
  round('Round'),
  sunglasses('Sunglasses'),
  wayfarers('Wayfarers');

  final String label;
  const AccessoriesType(this.label);
}

/// Hair color
enum HairColor {
  auburn('Auburn', Color(0xFFA55728)),
  black('Black', Color(0xFF2C1B18)),
  blonde('Blonde', Color(0xFFB58143)),
  blondeGolden('Blonde Golden', Color(0xFFD6B370)),
  brown('Brown', Color(0xFF724133)),
  brownDark('Brown Dark', Color(0xFF4A312C)),
  pastelPink('Pastel Pink', Color(0xFFF59797)),
  blue('Blue', Color(0xFF000FDB)),
  platinum('Platinum', Color(0xFFECDCBF)),
  red('Red', Color(0xFFC93305)),
  silverGray('Silver Gray', Color(0xFFE8E1E1));

  final String label;
  final Color color;
  const HairColor(this.label, this.color);
}

/// Hat color (same palette used for clothe colors)
enum HatColor {
  black('Black', Color(0xFF262E33)),
  blue01('Blue 01', Color(0xFF65C9FF)),
  blue02('Blue 02', Color(0xFF5199E4)),
  blue03('Blue 03', Color(0xFF25557C)),
  gray01('Gray 01', Color(0xFFE6E6E6)),
  gray02('Gray 02', Color(0xFF929598)),
  heather('Heather', Color(0xFF3C4F5C)),
  pastelBlue('Pastel Blue', Color(0xFFB1E2FF)),
  pastelGreen('Pastel Green', Color(0xFFA7FFC4)),
  pastelOrange('Pastel Orange', Color(0xFFFFDEB5)),
  pastelRed('Pastel Red', Color(0xFFFFAFB9)),
  pastelYellow('Pastel Yellow', Color(0xFFFFFFB1)),
  pink('Pink', Color(0xFFFF488E)),
  red('Red', Color(0xFFFF5C5C)),
  white('White', Color(0xFFFFFFFF));

  final String label;
  final Color color;
  const HatColor(this.label, this.color);
}

/// Facial hair type
enum FacialHairType {
  blank('Blank'),
  beardLight('Beard Light'),
  beardMajestic('Beard Majestic'),
  beardMedium('Beard Medium'),
  moustacheFancy('Moustache Fancy'),
  moustacheMagnum('Moustache Magnum');

  final String label;
  const FacialHairType(this.label);
}

/// Facial hair color
enum FacialHairColor {
  auburn('Auburn', Color(0xFFA55728)),
  black('Black', Color(0xFF2C1B18)),
  blonde('Blonde', Color(0xFFB58143)),
  blondeGolden('Blonde Golden', Color(0xFFD6B370)),
  brown('Brown', Color(0xFF724133)),
  brownDark('Brown Dark', Color(0xFF4A312C)),
  platinum('Platinum', Color(0xFFECDCBF)),
  red('Red', Color(0xFFC93305));

  final String label;
  final Color color;
  const FacialHairColor(this.label, this.color);
}

/// Clothe type
enum ClotheType {
  blazerShirt('Blazer Shirt'),
  blazerSweater('Blazer Sweater'),
  collarSweater('Collar Sweater'),
  graphicShirt('Graphic Shirt'),
  hoodie('Hoodie'),
  overall('Overall'),
  shirtCrewNeck('Shirt Crew Neck'),
  shirtScoopNeck('Shirt Scoop Neck'),
  shirtVNeck('Shirt V-Neck');

  final String label;
  const ClotheType(this.label);
}

/// Clothe color (same palette as hat color)
enum ClotheColor {
  black('Black', Color(0xFF262E33)),
  blue01('Blue 01', Color(0xFF65C9FF)),
  blue02('Blue 02', Color(0xFF5199E4)),
  blue03('Blue 03', Color(0xFF25557C)),
  gray01('Gray 01', Color(0xFFE6E6E6)),
  gray02('Gray 02', Color(0xFF929598)),
  heather('Heather', Color(0xFF3C4F5C)),
  pastelBlue('Pastel Blue', Color(0xFFB1E2FF)),
  pastelGreen('Pastel Green', Color(0xFFA7FFC4)),
  pastelOrange('Pastel Orange', Color(0xFFFFDEB5)),
  pastelRed('Pastel Red', Color(0xFFFFAFB9)),
  pastelYellow('Pastel Yellow', Color(0xFFFFFFB1)),
  pink('Pink', Color(0xFFFF488E)),
  red('Red', Color(0xFFFF5C5C)),
  white('White', Color(0xFFFFFFFF));

  final String label;
  final Color color;
  const ClotheColor(this.label, this.color);
}

/// Graphic on a graphic shirt
enum GraphicType {
  skull('Skull'),
  skullOutline('Skull Outline'),
  bat('Bat'),
  cumbia('Cumbia'),
  deer('Deer'),
  diamond('Diamond'),
  hola('Hola'),
  selena('Selena'),
  pizza('Pizza'),
  resist('Resist'),
  bear('Bear');

  final String label;
  const GraphicType(this.label);
}

/// Eye type
enum EyeType {
  close('Close'),
  cry('Cry'),
  defaultEye('Default'),
  dizzy('Dizzy'),
  eyeRoll('Eye Roll'),
  happy('Happy'),
  hearts('Hearts'),
  side('Side'),
  squint('Squint'),
  surprised('Surprised'),
  wink('Wink'),
  winkWacky('Wink Wacky');

  final String label;
  const EyeType(this.label);
}

/// Eyebrow type
enum EyebrowType {
  angry('Angry'),
  angryNatural('Angry Natural'),
  defaultBrow('Default'),
  defaultNatural('Default Natural'),
  flatNatural('Flat Natural'),
  frownNatural('Frown Natural'),
  raisedExcited('Raised Excited'),
  raisedExcitedNatural('Raised Excited Natural'),
  sadConcerned('Sad Concerned'),
  sadConcernedNatural('Sad Concerned Natural'),
  unibrowNatural('Unibrow Natural'),
  upDown('Up Down'),
  upDownNatural('Up Down Natural');

  final String label;
  const EyebrowType(this.label);
}

/// Mouth type
enum MouthType {
  concerned('Concerned'),
  defaultMouth('Default'),
  disbelief('Disbelief'),
  eating('Eating'),
  grimace('Grimace'),
  sad('Sad'),
  screamOpen('Scream Open'),
  serious('Serious'),
  smile('Smile'),
  tongue('Tongue'),
  twinkle('Twinkle'),
  vomit('Vomit');

  final String label;
  const MouthType(this.label);
}

/// Skin color
enum SkinColor {
  tanned('Tanned', Color(0xFFFD9841)),
  yellow('Yellow', Color(0xFFF8D25C)),
  pale('Pale', Color(0xFFFFDBB4)),
  light('Light', Color(0xFFEDB98A)),
  brown('Brown', Color(0xFFD08B5B)),
  darkBrown('Dark Brown', Color(0xFFAE5D29)),
  black('Black', Color(0xFF614335));

  final String label;
  final Color color;
  const SkinColor(this.label, this.color);
}
