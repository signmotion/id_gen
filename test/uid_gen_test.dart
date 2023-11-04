import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  final gen = UuidV5Gen();

  test('generate many UUIDs', () {
    var prevId = '';
    for (var i = 0; i < 4; ++i) {
      final id = gen.get();
      expect(id != prevId, isTrue, reason: '$id == $prevId');
      prevId = id;
    }
  });
}
