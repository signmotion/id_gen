import 'package:test/expect.dart';

import '../extensions/uuid_ext.dart';

/// A matcher that matches the String is UUID.
const isUuid = _IsUuid();

/// A matcher that matches the String is not UUID.
const isNotUuid = _IsNotUuid();

class _IsUuid extends Matcher {
  const _IsUuid();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      item is String && item.isUuid;

  @override
  Description describe(Description description) => description.add('isUuid');
}

class _IsNotUuid extends Matcher {
  const _IsNotUuid();

  @override
  bool matches(Object? item, Map<dynamic, dynamic> matchState) =>
      item! is String || (item is String && item.isNotUuid);

  @override
  Description describe(Description description) => description.add('isNotUuid');
}
