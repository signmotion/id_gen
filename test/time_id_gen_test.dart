import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generate', () {
    test('milliseconds', () {
      const gen = TimeIdGen(TimeIdType.milliseconds);
      final generated = <int>{};
      for (var i = 0; i < 1200; ++i) {
        final id = gen.next;
        expect(id, isNot(contains(generated)));
        generated.add(id);
      }
    });

    test('microseconds', () {
      const gen = TimeIdGen(TimeIdType.microseconds);
      final generated = <int>{};
      for (var i = 0; i < 1200; ++i) {
        final id = gen.next;
        expect(id, isNot(contains(generated)));
        generated.add(id);
      }
    });
  });
}
