import 'package:dart_helpers/dart_helpers.dart';

extension UuidStringExt on String {
  static const detector =
      r'[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}';

  /// '44030040-ca6d-43a3-9fda-0d121401f268'.isUuid == true
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

  /// Left 2 first and 2 last symbols. Before them will able [bittenOfReplacer].
  String get bittenOfUuid22 => bittenOf(2, 2, bittenOfReplacer);

  /// Left 4 first and 4 last symbols. Before them will able [bittenOfReplacer].
  String get bittenOfUuid44 => bittenOf(4, 4, bittenOfReplacer);

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids22 => bittenOfAllUuids(2, 2);

  /// See [bittenOfAllUuids].
  String get bittenOfAllUuids44 => bittenOfAllUuids(4, 4);

  /// Bitten of all UUIDs into the text.
  /// Left [begin] first and [end] last symbols in each UUID.
  /// Before them will insert [replacer].
  /// See [bittenOfUuid22], [bittenOfUuid44].
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

extension UuidsStringExt on List<String> {
  /// Same [bittenOfUuid22] but for list.
  List<String> get bittenOfUuid22 =>
      bittenOf(2, 2, UuidStringExt.bittenOfReplacer);

  /// Same [bittenOfUuid44] but for list.
  List<String> get bittenOfUuid44 =>
      bittenOf(4, 4, UuidStringExt.bittenOfReplacer);
}
