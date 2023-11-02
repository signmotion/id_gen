import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

import 'id_gen_base.dart';

/// UUID generator.
class UuidGen extends IdGenBase<Uuid> {
  const UuidGen({this.options});

  final GlobalOptions? options;

  @override
  Uuid get([dynamic source]) => Uuid(goptions: options);
}

/// UUID v5 generator.
class UuidV5Gen extends IdGenBase<String> {
  const UuidV5Gen({
    this.options,
    this.namespace = Namespace.URL,
    this.name,
  });

  final GlobalOptions? options;
  final String? namespace;
  final String? name;

  @override
  String get([dynamic source]) => Uuid(goptions: options).v5(namespace, name);
}
