import 'dart:collection';

import 'package:flutter/services.dart' show rootBundle;

/// LRU cache for loaded SVG asset fragments.
///
/// Assets are loaded on demand via [load] and cached for subsequent access.
/// When [maxEntries] is set, least-recently-used entries are evicted once
/// the cache exceeds that size.
///
/// Use [instance] for the shared global cache, or [SvgCache.fromMap] to
/// create a pre-populated cache for testing.
class SvgCache {
  /// Create an empty cache that loads assets via [rootBundle].
  SvgCache({this.maxEntries}) : _cache = LinkedHashMap<String, String>();

  /// Create a pre-populated cache (useful for testing).
  SvgCache.fromMap(Map<String, String> data, {this.maxEntries})
      : _cache = LinkedHashMap<String, String>.of(data);

  /// Shared global cache instance.
  static final SvgCache instance = SvgCache();

  /// Maximum number of cached entries. When null, entries are never evicted.
  final int? maxEntries;

  final LinkedHashMap<String, String> _cache;

  /// Load an asset, returning cached content if available.
  ///
  /// Returns an empty string immediately if [path] is empty (used for
  /// variants like "blank" that have no SVG fragment).
  ///
  /// On cache hit the entry is promoted to most-recently-used.
  /// On cache miss the asset is loaded from [rootBundle] and the oldest
  /// entries are evicted if [maxEntries] is exceeded.
  Future<String> load(String path) async {
    if (path.isEmpty) return '';
    final existing = _cache.remove(path);
    if (existing != null) {
      _cache[path] = existing; // promote to most-recently-used
      return existing;
    }
    final content = await rootBundle.loadString(path);
    _cache[path] = content;
    _evict();
    return content;
  }

  /// Get a previously loaded fragment. Throws if not yet loaded.
  String operator [](String path) => _cache[path]!;

  void _evict() {
    final max = maxEntries;
    if (max == null) return;
    while (_cache.length > max) {
      _cache.remove(_cache.keys.first);
    }
  }
}
