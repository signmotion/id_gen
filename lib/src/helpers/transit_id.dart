import '../transit_id_gen.dart';

int get genTransitId => _transitId.next;
final _transitId = TransitIdGen();
