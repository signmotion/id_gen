import 'package:id_gen/id_gen.dart';
import 'package:test/test.dart';

void main() {
  final replaces = <String, String>{
    ...HidGenOptions.defaultReplaces,
    ...<String, String>{
      'W': 'V',
    },
  };
  final removes = <String>[
    ...HidGenOptions.defaultRemoves,
    'Q',
  ];
  final options = HidGenOptions(
    replaces: replaces,
    removes: removes,
  );
  final gen = HidGen(options: options);

  group('generate ID by string with latin chars', () {
    test('no spaces', () {
      expect(gen.get('abcxyz'), 'abcxyz');
      expect(gen.get('ABCXYZ'), 'ABCXYZ');
      expect(gen.get('abcXYZ'), 'abcXYZ');
    });

    test('with spaces', () {
      expect(gen.get('abc XYZ'), 'abc-XYZ');
      expect(gen.get(' abc      XYZ    '), 'abc-XYZ');
    });

    test('with `-`', () {
      expect(gen.get('abc-XYZ'), 'abc-XYZ');
      expect(gen.get('   abc  -      XYZ '), 'abc-XYZ');
      expect(gen.get('   abc  -  ---    XYZ '), 'abc-XYZ');
    });

    test('with `-` on the edges', () {
      expect(gen.get('-abc-XYZ'), 'abc-XYZ');
      expect(gen.get(' -  abc  -      XYZ - '), 'abc-XYZ');
      expect(gen.get('-   --abc  -  ---    XYZ --'), 'abc-XYZ');
    });

    test('with `_`', () {
      expect(gen.get('abc_XYZ'), 'abc-XYZ');
      expect(gen.get('   abc  _      XYZ '), 'abc-XYZ');
      expect(gen.get('   abc  _ ___     XYZ '), 'abc-XYZ');
    });

    test('with removes', () {
      expect(gen.get('abcQXYZ'), 'abcXYZ');
      expect(gen.get('abc Q XYZ'), 'abc-XYZ');
    });

    test('with replaces', () {
      expect(gen.get('abcWXYZ'), 'abcVXYZ');
      expect(gen.get('abc W XYZ'), 'abc-V-XYZ');
    });
  });

  group('generate ID by string with cyrillic chars', () {
    test('no spaces', () {
      expect(
        gen.get('абвгґдеєжзиіїйклмнопрстуфхцчшщьюяэй'),
        'abvhgdeiezhzyiklmnoprstufkhtschshshchiuiaei',
      );
      expect(
        gen.get('АБВГҐДЕЄЖЗИІЇЙКЛМНОПРСТУФХЦЧШЩЬЮЯЭЙ'),
        'ABVHGDEIEZHZYIKLMNOPRSTUFKHTSCHSHSHCHIUIAEI',
      );
      expect(
        gen.get('абвгґдеєжзиіїйклМНОПРСТУФХЦЧШЩЬЮЯЭЙ'),
        'abvhgdeiezhzyiklMNOPRSTUFKHTSCHSHSHCHIUIAEI',
      );
    });

    test(' with spaces', () {
      expect(
        gen.get('абвгґдеєжзиіїйкл МНОПРСТУФХЦЧШЩЬЮЯЭЙ'),
        'abvhgdeiezhzyikl-MNOPRSTUFKHTSCHSHSHCHIUIAEI',
      );
      expect(
        gen.get(' абвгґдеєжзиіїйкл      МНОПРСТУФХЦЧШЩЬЮЯЭЙ    '),
        'abvhgdeiezhzyikl-MNOPRSTUFKHTSCHSHSHCHIUIAEI',
      );
    });
  });

  test('generate ID by string with unsafe URL chars', () {
    expect(gen.get('abc"`”“\'xyz'), 'abcxyz');
    expect(gen.get(r'abc~!#$%^&*()\,./<>@|-+xyz'), 'abc-xyz');
  });

  group('live examples', () {
    test('1', () {
      final options = HumanIdGenOptions(lowerCase: true);
      final gen = HumanIdGen(options: options);
      final hid = gen.get('Тема статті чи назва курсу');
      expect(hid, 'tema-stati-chy-nazva-kursu');
    });
  });
}
