import 'id_gen_base.dart';
import 'transit_id.dart';

/// Transit integer ID generator.
class TransitIdGen extends IdGenBase<int> {
  TransitIdGen([int firstId = 0, int delta = 1])
      : _transitId = TransitId(firstId, delta);

  /// Each call generate a new ID.
  @override
  int get([dynamic source]) => next;

  @override
  int get next => _transitId!.next;

  int get current => _transitId!.current;

  int get delta => _transitId!.delta;

  final TransitId? _transitId;
}
