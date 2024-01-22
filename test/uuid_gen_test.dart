import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  const gen = UuidGen();

  test('generate many UUIDs', () {
    var prevId = '';
    for (var i = 0; i < 4; ++i) {
      final id = gen.next;
      expect(id != prevId, isTrue, reason: '$id == $prevId');
      prevId = id;
    }
  });
}
