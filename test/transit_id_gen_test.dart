import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  var prevId = 0;

  test('transit IDs gen, positive', () {
    final gen = TransitIdGen();
    for (var i = 0; i < 4; ++i) {
      final id = gen.next;
      expect(id, greaterThan(prevId));
      expect([1, 2, 3, 4][i], id);
      prevId = id;
    }
  });

  test('transit IDs gen, negative', () {
    final gen = TransitIdGen(1400, -400);
    expect(gen.current, 1400);
    expect(gen.delta, -400);
    prevId = 1400;
    for (var i = 0; i < 4; ++i) {
      final id = gen.next;
      expect(id, lessThan(prevId));
      expect([1000, 600, 200, -200][i], id);
      prevId = id;
    }
    expect(gen.current, 1400 - 400 * 4);
  });
}
