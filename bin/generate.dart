// ignore_for_file: avoid_print // We use print for simple CLI output.
import 'dart:io';

import 'package:flutter_avataaars/flutter_avataaars.dart';

SvgCache _loadCacheFromDisk() {
  const prefix = 'packages/avataaars/lib/assets';
  const diskPrefix = 'lib/assets';
  final map = <String, String>{};

  final dir = Directory(diskPrefix);
  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && entity.path.endsWith('.svgf')) {
      final relative = entity.path.substring(diskPrefix.length + 1);
      map['$prefix/$relative'] = entity.readAsStringSync();
    }
  }
  return SvgCache.fromMap(map);
}

void main() async {
  final cache = _loadCacheFromDisk();
  final avatar = Avataaar.random();

  final svgStr = await avatar.toSvg(cache: cache);

  final file = File('random_avatar.svg');
  await file.writeAsString(svgStr);
  print('Generated SVG saved to ${file.absolute.path}');
}
