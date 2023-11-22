import 'package:dart_helpers/dart_helpers.dart';

extension UuidStringExt on String {
  static const detector =
      r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}';

  /// '44030040-ca6d-43a3-9fda-0d121401f268'.isUuid == true
  /// '  44030040-ca6d-43a3-9fda-0d121401f268 '.isUuid == true
  bool get isUuid =>
      RegExp('^$detector\$', caseSensitive: false).hasMatch(trim());

  bool get isNotUuid => !isUuid;

  /// 's-44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('s') == true
  bool isUuidWithPrefix([String prefix = '']) {
    assert(!prefix.contains('-'), 'The symbol `-` restricted for prefix.');

    final s = trim();
    if (s.isEmpty) {
      return false;
    }

    late final String p;
    if (prefix.isEmpty) {
      // detecting prefix
      final splitted = s.split('-');
      if (splitted.length != 6) {
        return false;
      }

      p = splitted.first;
    } else {
      p = prefix;
    }

    if (!s.startsWith(prefix)) {
      return false;
    }

    final body = s.replaceFirst('$p-', '');
    final bodyTrim = body.trim();
    if (s.length == bodyTrim.length || bodyTrim.length != body.length) {
      return false;
    }

    return body.isUuid;
  }

  bool isNotUuidWithPrefix([String prefix = '']) => !isUuidWithPrefix(prefix);

  static const bittenOfReplacer = ':';

  /// Left 3 first and 2 last symbols. Before them will able [bittenOfReplacer].
  String get bittenOfUuid32 => isUuid || isUuidWithPrefix()
      ? trim().bittenOf(3, 2, bittenOfReplacer)
      : this;

  /// Left 4 first and 4 last symbols. Before them will able [bittenOfReplacer].
  String get bittenOfUuid44 => isUuid || isUuidWithPrefix()
      ? trim().bittenOf(4, 4, bittenOfReplacer)
      : this;

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids32 => bittenOfAllUuids(3, 2);

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids44 => bittenOfAllUuids(4, 4);

  /// Bitten of all UUIDs into the text.
  /// Left [begin] first and [end] last symbols in each UUID.
  /// Before them will insert [replacer].
  /// See [bittenOfUuid32], [bittenOfUuid44].
  String bittenOfAllUuids(
    int begin,
    int end, [
    String replacer = bittenOfReplacer,
  ]) {
    var s = this;

    final regex = RegExp(detector, caseSensitive: false);
    final matches = regex.allMatches(this);
    for (final match in matches) {
      final m = match[0]!;
      s = s.replaceFirst(m, m.bittenOf(begin, end, replacer));
    }

    return s;
  }
}

extension UuidsListExt on List<dynamic> {
  /// Same [bittenOfUuid32] but for list.
  List<dynamic> get bittenOfAllUuids32 =>
      bittenOf(3, 2, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOfUuid44] but for list.
  List<dynamic> get bittenOfAllUuids44 =>
      bittenOf(4, 4, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOf] but for the each string into the list.
  List<dynamic> bittenOf(int begin, int end, [String replacer = '..']) => map(
        (v) => v is String && (v.isUuid || v.isUuidWithPrefix())
            ? v.bittenOf(begin, end, replacer)
            : v,
      ).toList();
}

extension UuidsSetExt on Set<dynamic> {
  /// Same [bittenOfUuid32] but for set.
  Set<dynamic> get bittenOfAllUuids32 =>
      bittenOf(3, 2, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOfUuid44] but for set.
  Set<dynamic> get bittenOfAllUuids44 =>
      bittenOf(4, 4, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOf] but for the each string into the set.
  Set<dynamic> bittenOf(int begin, int end, [String replacer = '..']) => map(
        (v) => v is String && (v.isUuid || v.isUuidWithPrefix())
            ? v.bittenOf(begin, end, replacer)
            : v,
      ).toSet();
}

extension UuidsMapExt on Map<String, dynamic> {
  /// Same [bittenOfUuid32] but for map.
  Map<String, dynamic> get bittenOfAllUuids32 =>
      bittenOf(3, 2, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOfUuid44] but for map.
  Map<String, dynamic> get bittenOfAllUuids44 =>
      bittenOf(4, 4, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOf] but for the each UUIDs into the map.
  Map<String, dynamic> bittenOf(int begin, int end, [String replacer = '..']) =>
      _bittenOf(begin, end, replacer);

  Map<String, dynamic> _bittenOf(
    int begin,
    int end, [
    String replacer = '..',
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
