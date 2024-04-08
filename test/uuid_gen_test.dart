import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  group('generate', () {
    test('many unique UUIDs', () {
      const gen = UuidGen();
      final generated = <String>{};
      for (var i = 0; i < 1200000; ++i) {
        final id = gen.next;
        expect(id, isNot(contains(generated)));
        generated.add(id);
      }
    });
  });
}
