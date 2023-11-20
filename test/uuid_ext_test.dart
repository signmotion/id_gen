import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  test('isUuid', () {
    expect('44030040-ca6d-43a3-9fda-0d121401f268', isUuid);
    expect('44030040-CA6D-43A3-9FDA-0D121401F268', isUuid);
    expect('44030040-CA6D-43a3-9fda-0d121401f268', isUuid);
    expect(' 44030040-CA6D-43a3-9fda-0d121401f268   ', isUuid);
  });

  test('isNotUuid', () {
    // false
    expect('44030040_ca6d_43a3_9fda_0d121401f268', isNotUuid);
    expect('44030040ca6d43a39fda0d121401f268', isNotUuid);
    expect('44030040ca6d43a39fda0d121401f268abcd', isNotUuid);
    expect('44030040-CA6D-43a3-9fda-0d121401f2680', isNotUuid);
    expect('44030040-CA6D-43a3-9fda-0d121401f26', isNotUuid);
    expect('44030040-CA6D-43a3-9fda - 0d121401f268', isNotUuid);
    expect('44030040-CA6D-43a3-9fda - 0d121401f2', isNotUuid);
    expect('44030040-CA6D-43a3-9fda-0d121401f26-', isNotUuid);
    expect('-4030040-CA6D-43a3-9fda-0d121401f268', isNotUuid);
    expect('', isNotUuid);
    expect('abcd-123456', isNotUuid);
  });

  test('isUuidWithPrefix()', () {
    expect('s-44030040-ca6d-43a3-9fda-0d121401f268', isUuidWithPrefix);
    expect('   s-44030040-CA6D-43A3-9FDA-0D121401F268 ', isUuidWithPrefix);

    expect('session-44030040-ca6d-43a3-9fda-0d121401f268', isUuidWithPrefix);
  });

  test('isNotUuidWithPrefix()', () {
    expect('44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix(), isFalse);
    expect('44030040-ca6d-43a3-9fda-0d121401f268', isNotUuidWithPrefix);

    expect('', isNotUuidWithPrefix);
    expect('       ', isNotUuidWithPrefix);
    expect('s-', isNotUuidWithPrefix);
    expect('s-     ', isNotUuidWithPrefix);

    expect('a-s-44030040-ca6d-43a3-9fda-0d121401f268', isNotUuidWithPrefix);
    expect('s--44030040-CA6D-43A3-9FDA-0D121401F268', isNotUuidWithPrefix);
    expect('-s-44030040-CA6D-43A3-9FDA-0D121401F268', isNotUuidWithPrefix);
    expect('session44030040-ca6d-43a3-9fda-0d121401f268', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268-session', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268session-', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268session', isNotUuidWithPrefix);
  });

  test('isUuidWithPrefix(p)', () {
    expect(
        'p-44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('p'), isTrue);
    expect('  p-44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('p'),
        isTrue);
  });

  test('isNotUuidWithPrefix(p)', () {
    expect(
        '44030040-ca6d-43a3-9fda-0d121401f268'.isUuidWithPrefix('p'), isFalse);
    expect('44030040-ca6d-43a3-9fda-0d121401f268'.isNotUuidWithPrefix('p'),
        isTrue);

    expect('v-44030040-ca6d-43a3-9fda-0d121401f268'.isNotUuidWithPrefix('p'),
        isTrue);
    expect('p -44030040-ca6d-43a3-9fda-0d121401f268'.isNotUuidWithPrefix('p'),
        isTrue);
    expect('pp-44030040-ca6d-43a3-9fda-0d121401f268'.isNotUuidWithPrefix('p'),
        isTrue);
  });

  test('bittenOfUuid44', () {
    expect('44030040-ca6d-43a3-9fda-0d121401f268'.bittenOfUuid44, '4403:f268');
    expect(
        'p-44030040-ca6d-43a3-9fda-0d121401f268'.bittenOfUuid44, 'p-44:f268');

    expect('any string'.bittenOfUuid44, 'any :ring');
    expect('   any string '.bittenOfUuid44, '   a:ing ');
  });
}
