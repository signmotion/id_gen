import 'package:test/expect.dart';

import '../extensions/uuid_ext.dart';

/// A matcher that matches the String is UUID with prefix.
const Matcher isUuidWithPrefix = _IsUuidWithPrefix();

/// A matcher that matches the String is not UUID.
const Matcher isNotUuidWithPrefix = _IsNotUuidWithPrefix();

class _IsUuidWithPrefix extends Matcher {
  const _IsUuidWithPrefix();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      item is String && item.isUuidWithPrefix();

  @override
  Description describe(Description description) =>
      description.add('isUuidWithPrefix');
}

class _IsNotUuidWithPrefix extends Matcher {
  const _IsNotUuidWithPrefix();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      item! is String || (item is String && item.isNotUuidWithPrefix());

  @override
  Description describe(Description description) =>
      description.add('isNotUuidWithPrefix');
}
