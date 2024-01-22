import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  test('generate many time IDs with milliseconds', () {
    const gen = TimeIdGen(TimeIdType.milliseconds);
    var prevId = 0;
    for (var i = 0; i < 4; ++i) {
      final id = gen.next;
      expect(id, greaterThan(prevId));
      prevId = id;
    }
  });

  test('generate many time IDs with microseconds', () {
    const gen = TimeIdGen(TimeIdType.microseconds);
    var prevId = 0;
    for (var i = 0; i < 4; ++i) {
      final id = gen.next;
      expect(id, greaterThan(prevId));
      prevId = id;
    }
  });
}
