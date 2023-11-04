import 'package:uuid/data.dart';
import 'package:uuid/rng.dart';
import 'package:uuid/uuid.dart';

import 'id_gen_base.dart';

/// UUID generator.
class UuidGen extends IdGenBase<Uuid> {
  const UuidGen({this.options});

  final GlobalOptions? options;

  @override
  Uuid get([dynamic source]) => Uuid(goptions: options);
}

/// UUID v4 generator.
class UuidV4Gen extends IdGenBase<String> {
  const UuidV4Gen({this.options});

  final GlobalOptions? options;

  Uuid get gen => Uuid(goptions: options);

  List<int>? get random => null;

  RNG get rng => CryptoRNG();

  @override
  String get([dynamic source]) => gen.v4(config: V4Options(random, rng));
}
