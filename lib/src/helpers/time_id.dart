import '../time_id_gen.dart';

int get genTimeId => _timeId.next;
const _timeId = TimeIdGen();

int get genTimeIdMicro => _timeIdMicro.next;
const _timeIdMicro = TimeIdGen(TimeIdType.microseconds);
