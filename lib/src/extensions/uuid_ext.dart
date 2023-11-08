extension UuidStringExt on String {
  bool get isUuid => RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
        caseSensitive: false,
      ).hasMatch(trim());

  bool get isNotUuid => !isUuid;
}
