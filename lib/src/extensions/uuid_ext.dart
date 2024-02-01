import 'string_ext.dart';

/// Separator between a prefix and UUID.
String get uuidPrefixSeparator => '-';

/// Replacer for shrinked UUID.
String get uuidBittenOfReplacer => ':';

extension UuidStringExt on String {
  static const detector =
      r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}';

  /// '44030040-ca6d-43a3-9fda-0d121401f268'.isUuid == true
  /// '  44030040-ca6d-43a3-9fda-0d121401f268 '.isUuid == true
  bool get isUuid =>
      RegExp('^$detector\$', caseSensitive: false).hasMatch(trim());

  bool get isNotUuid => !isUuid;

  /// 's-44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('s') == true
  bool isUuidWithPrefix([String? prefix]) {
    assert(prefix == null || !prefix.contains(uuidPrefixSeparator),
        'The symbol `$uuidPrefixSeparator` restricted for prefix.');

    final s = trim();
    if (s.isEmpty) {
      return false;
    }

    late final String p;
    if (prefix == null) {
      // detecting prefix
      final splitted = s.split(uuidPrefixSeparator);
      if (splitted.length != 6) {
        return false;
      }

      p = splitted.first;
    } else {
      if (!s.startsWith(prefix)) {
        return false;
      }

      p = prefix;
    }

    final body = s.replaceFirst('$p$uuidPrefixSeparator', '');
    final bodyTrim = body.trim();
    if (s.length == bodyTrim.length || bodyTrim.length != body.length) {
      return false;
    }

    return body.isUuid;
  }

  bool isNotUuidWithPrefix([String prefix = '']) => !isUuidWithPrefix(prefix);

  /// Left 3 first and 2 last symbols. Between them will be [uuidBittenOfReplacer].
  /// TODO Count on prefix.
  /// TODO Rename to `*12`.
  String get bittenOfUuid32 => isUuid || isUuidWithPrefix()
      ? trim().bittenOf(3, 2, uuidBittenOfReplacer)
      : this;

  /// Left 4 first and 4 last symbols. Between them will be [uuidBittenOfReplacer].
  /// TODO Count on prefix.
  String get bittenOfUuid44 => isUuid || isUuidWithPrefix()
      ? trim().bittenOf(4, 4, uuidBittenOfReplacer)
      : this;

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids32 => bittenOfAllUuids(3, 2);

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids44 => bittenOfAllUuids(4, 4);

  /// Bitten of all UUIDs into the text.
  /// Left [begin] first and [end] last symbols in each UUID.
  /// Between them will be [replacer].
  /// See [bittenOfUuid32], [bittenOfUuid44].
  String bittenOfAllUuids(
    int begin,
    int end, {
    String prefix = '',
    String? replacer,
  }) {
    assert(!prefix.contains(uuidPrefixSeparator),
        'The symbol `$uuidPrefixSeparator` restricted for prefix.');

    var s = this;

    final regex = RegExp(
      prefix.isEmpty ? detector : '$prefix$uuidPrefixSeparator$detector',
      caseSensitive: false,
    );
    final matches = regex.allMatches(this);
    for (final match in matches) {
      final m = match[0]!;
      s = s.replaceFirst(
        m,
        m.bittenOf(begin, end, replacer ?? uuidBittenOfReplacer),
      );
    }

    return s;
  }
}

extension UuidsListExt on List<dynamic> {
  /// Same [bittenOfUuid32] but for list.
  List<dynamic> get bittenOfAllUuids32 => bittenOf(3, 2, uuidBittenOfReplacer);

  /// Same [bittenOfUuid44] but for list.
  List<dynamic> get bittenOfAllUuids44 => bittenOf(4, 4, uuidBittenOfReplacer);

  /// Same [bittenOf] but for the each string into the list.
  List<dynamic> bittenOf(int begin, int end, [String? replacer]) => map(
        (v) => v is String && (v.isUuid || v.isUuidWithPrefix())
            ? v.bittenOf(begin, end, replacer ?? uuidBittenOfReplacer)
            : v,
      ).toList();
}

extension UuidsSetExt on Set<dynamic> {
  /// Same [bittenOfUuid32] but for set.
  Set<dynamic> get bittenOfAllUuids32 => bittenOf(3, 2, uuidBittenOfReplacer);

  /// Same [bittenOfUuid44] but for set.
  Set<dynamic> get bittenOfAllUuids44 => bittenOf(4, 4, uuidBittenOfReplacer);

  /// Same [bittenOf] but for the each string into the set.
  Set<dynamic> bittenOf(int begin, int end, [String? replacer]) => map(
        (v) => v is String && (v.isUuid || v.isUuidWithPrefix())
            ? v.bittenOf(begin, end, replacer ?? uuidBittenOfReplacer)
            : v,
      ).toSet();
}

extension UuidsMapExt on Map<String, dynamic> {
  /// Same [bittenOfUuid32] but for map.
  Map<String, dynamic> get bittenOfAllUuids32 =>
      bittenOf(3, 2, uuidBittenOfReplacer);

  /// Same [bittenOfUuid44] but for map.
  Map<String, dynamic> get bittenOfAllUuids44 =>
      bittenOf(4, 4, uuidBittenOfReplacer);

  /// Same [bittenOf] but for the each UUIDs into the map.
  Map<String, dynamic> bittenOf(int begin, int end, [String? replacer]) =>
      _bittenOf(begin, end, replacer ?? uuidBittenOfReplacer);

  Map<String, dynamic> _bittenOf(
    int begin,
    int end, [
    String? replacer,
  ]) =>
      map((k, v) {
        late final dynamic r;
        if (v is String && (v.isUuid || v.isUuidWithPrefix())) {
          r = v.bittenOf(begin, end, replacer);
        } else if (v is Map<String, dynamic>) {
          r = v._bittenOf(begin, end, replacer);
        } else if (v is List<dynamic>) {
          r = v.bittenOf(begin, end, replacer);
        } else if (v is Set<dynamic>) {
          r = v.bittenOf(begin, end, replacer);
        } else {
          r = v;
        }

        return MapEntry(k, r);
      });
}
