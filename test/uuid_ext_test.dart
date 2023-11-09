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
    expect('a-s-44030040-ca6d-43a3-9fda-0d121401f268', isNotUuidWithPrefix);
    expect('s--44030040-CA6D-43A3-9FDA-0D121401F268', isNotUuidWithPrefix);
    expect('-s-44030040-CA6D-43A3-9FDA-0D121401F268', isNotUuidWithPrefix);
    expect('session44030040-ca6d-43a3-9fda-0d121401f268', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268-session', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268session-', isNotUuidWithPrefix);
    expect('44030040-ca6d-43a3-9fda-0d121401f268session', isNotUuidWithPrefix);
  });
}
