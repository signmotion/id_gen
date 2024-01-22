import '../uuid_gen.dart';

String get genUuid => _uuid.next;
const _uuid = UuidGen();
