import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_tests.dart';
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

  test('bittenOfUuid44 on List', () {
    expect(
        <dynamic>[
          '44030040-ca6d-43a3-9fda-0d121401f268',
          '   any  text ',
        ].bittenOfAllUuids44,
        <dynamic>[
          '4403:f268',
          '   any  text ',
        ]);
  });

  test('bittenOfUuid44 on Set', () {
    expect(
        <dynamic>{
          '44030040-ca6d-43a3-9fda-0d121401f268',
          '   any  text ',
        }.bittenOfAllUuids44,
        <dynamic>{
          '4403:f268',
          '   any  text ',
        });
  });

  test('bittenOfUuid44 on Map', () {
    expect(
        <String, dynamic>{
          'uid': '44030040-ca6d-43a3-9fda-0d121401f268',
          'a': '   any  text ',
          'b': 0,
          'null': null,
          'list': [12, 'l-44030040-ca6d-43a3-9fda-0d121401f268'],
          'set': {12, 's-44030040-ca6d-43a3-9fda-0d121401f268'},
          'map': {'c': 12, 'd': 'm-44030040-ca6d-43a3-9fda-0d121401f268'},
        }.bittenOfAllUuids44,
        <String, dynamic>{
          'uid': '4403:f268',
          'a': '   any  text ',
          'b': 0,
          'null': null,
          'list': [12, 'l-44:f268'],
          'set': {12, 's-44:f268'},
          'map': {'c': 12, 'd': 'm-44:f268'},
        });
  });

  test('bittenOfUuid44 on String', () {
    expect('44030040-ca6d-43a3-9fda-0d121401f268'.bittenOfUuid44, '4403:f268');
    expect(
        'p-44030040-ca6d-43a3-9fda-0d121401f268'.bittenOfUuid44, 'p-44:f268');

    expect(
        '  44030040-ca6d-43a3-9fda-0d121401f268 '.bittenOfUuid44, '4403:f268');

    expect('any string'.bittenOfUuid44, 'any string');
    expect('   any string '.bittenOfUuid44, '   any string ');
  });

  test('bittenOfAllUuids44 on String', () {
    expect(
        '''
A connection to server
`InternetAddress('0.0.0.0', IPv4):8080 🧠 Cogentia Cortex [💞aides, 💞Buttler]`
to 10.0.2.2:8080 opened with session `s-925e903d-4b58-4a08-bdf5-a3aedd78d998`
and participant client `p-1aece77f-3214-414d-8dae-3e30a909c420`
for device `e196521333ec06e6`.

Meet m-9eb5951f-fab0-4907-b312-b4f7a1ea194d organized  with invited participants
`[p-1aece77f-3214-414d-8dae-3e30a909c420, p-613d9ca3-9cf7-4fa4-88df-5a4e4f58490d]`
into shared room `t-9d5feb14-3678-4fb9-abb2-7655fe6a5607`.
'''
            .bittenOfAllUuids44,
        '''
A connection to server
`InternetAddress('0.0.0.0', IPv4):8080 🧠 Cogentia Cortex [💞aides, 💞Buttler]`
to 10.0.2.2:8080 opened with session `s-925e:d998`
and participant client `p-1aec:c420`
for device `e196521333ec06e6`.

Meet m-9eb5:194d organized  with invited participants
`[p-1aec:c420, p-613d:490d]`
into shared room `t-9d5f:5607`.
''');
  });
}
