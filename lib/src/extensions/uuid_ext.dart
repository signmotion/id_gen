extension UuidStringExt on String {
  /// '44030040-ca6d-43a3-9fda-0d121401f268'.isUuid == true
  bool get isUuid => RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
        caseSensitive: false,
      ).hasMatch(trim());

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
}
