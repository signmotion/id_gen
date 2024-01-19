import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  var prevId = 0;

  test('transit IDs class, positive', () {
    final id = TransitId();
    for (var i = 0; i < 4; ++i) {
      final next = id.next;
      expect(next, greaterThan(prevId));
      prevId = next;
    }
  });

  test('transit IDs class, negative', () {
    final id = TransitId(1000, -400);
    expect(id.current, 1000);
    expect(id.delta, -400);
    prevId = 1000;
    for (var i = 0; i < 4; ++i) {
      final next = id.next;
      expect(next, lessThan(prevId));
      prevId = next;
    }
    expect(id.current, 1000 - 400 * 4);
  });
}
