# Flutter Avataaars

A Flutter widget that renders [avataaars](https://getavataaars.com/)-style avatars using `flutter_svg`. All SVG data is extracted from the original React [avataaars](https://github.com/fangpenlin/avataaars) library via server-side rendering, ensuring pixel-perfect fidelity.

## Usage

```dart
import 'package:avataaars/models/avataaar.dart';
import 'package:avataaars/widgets/avatar_widget.dart';

// Random avatar
AvatarWidget(avatar: Avataaar.random())

// Specific avatar
AvatarWidget(
  avatar: Avataaar(
    topType: TopType.shortHairShortFlat,
    accessoriesType: AccessoriesType.prescription01,
    hairColor: HairColor.brown,
    facialHairType: FacialHairType.blank,
    clotheType: ClotheType.hoodie,
    clotheColor: ClotheColor.blue01,
    eyeType: EyeType.defaultEye,
    eyebrowType: EyebrowType.defaultBrow,
    mouthType: MouthType.smile,
    skinColor: SkinColor.light,
  ),
)
```

## Regenerating SVG Data

The SVG fragments in `lib/svg/svg_data.dart` are generated from the original React avataaars library. To regenerate after changes:

### Prerequisites

- Node.js
- Python 3
- The `avataaars-generator` submodule checked out

### Steps

```bash
# 1. Clone with submodules (if not already done)
git submodule update --init

# 2. Install dependencies in the React project
cd avataaars-generator
npm install
npm install cheerio --no-save --legacy-peer-deps

# 3. Extract SVG fragments from the React components
NODE_PATH=./node_modules node ../tools/extract_svg_fragments.js

# 4. Generate the Dart file from the extracted fragments
cd ..
python3 tools/generate_svg_data.py
```

This produces `lib/svg/svg_data.dart` containing all SVG path data and the `buildAvatarSvg()` builder function.

### How it works

1. **`tools/extract_svg_fragments.js`** — Uses `ReactDOMServer.renderToStaticMarkup()` to render each avatar variant, then parses the SVG with `cheerio` to extract individual component groups (eyes, mouths, hair, etc.). Color values are replaced with placeholders like `{{SKIN_COLOR}}`. Output: `tools/svg_fragments.json`.

2. **`tools/generate_svg_data.py`** — Reads the JSON fragments and generates a Dart file with lookup functions for each component type and a `buildAvatarSvg()` function that composes the full SVG at runtime.

## Running

```bash
flutter pub get
flutter run
```

## Testing

```bash
flutter test
```

## Credits

This Flutter library is based on the [avataaars-generator](https://github.com/fangpenlin/avataaars-generator) by [Fang-Pen Lin](https://github.com/fangpenlin), which itself uses the avatar artwork created by [Pablo Stanley](https://getavataaars.com/).

## License

This project is licensed under the BSD License. It is free to use for both commercial and non-commercial purposes. See the [LICENSE](LICENSE) file for details.
