import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generate', () {
    test('positive', () {
      final gen = TransitIdGen();
      final generated = <int>{};
      for (var i = 0; i < 1200; ++i) {
        final id = gen.next;
        expect(id, isNot(contains(generated)));
        generated.add(id);
      }
    });

    test('negative', () {
      final gen = TransitIdGen(1400, -400);
      final generated = <int>{};
      for (var i = 0; i < 1200; ++i) {
        final id = gen.next;
        expect(id, isNot(contains(generated)));
        generated.add(id);
      }
    });
  });
}
