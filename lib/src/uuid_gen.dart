import 'package:uuid/data.dart';
import 'package:uuid/rng.dart';
import 'package:uuid/uuid.dart';

import 'id_gen_base.dart';

/// UUID v4 generator.
class UuidV4Gen extends IdGenBase<String> {
  const UuidV4Gen({this.options});

  final GlobalOptions? options;

  Uuid get gen => Uuid(goptions: options);

  List<int>? get random => null;

  RNG get rng => CryptoRNG();

  @override
  String get([dynamic source]) => next;

  @override
  String get next => gen.v4(config: V4Options(random, rng));
}
