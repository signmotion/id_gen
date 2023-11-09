extension UuidStringExt on String {
  /// '44030040-ca6d-43a3-9fda-0d121401f268'.isUuid == true
  bool get isUuid => RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
        caseSensitive: false,
      ).hasMatch(trim());

  bool get isNotUuid => !isUuid;

  /// 's-44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('s') == true
  bool isUuidWithPrefix([String prefix = '']) {
    final s = trim();
    late final String p;
    if (prefix.isEmpty) {
      // detecting prefix
      final splitted = s.split('-');
      p = (splitted.length < 2) ? '' : splitted.first;
    } else {
      p = prefix;
    }

    return s.replaceFirst('$p-', '').isUuid;
  }

  bool isNotUuidWithPrefix([String prefix = '']) => !isUuidWithPrefix(prefix);
}
