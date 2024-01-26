import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_tests.dart';
import 'package:test/test.dart';

class Quant with HasStringIdMix {
  Quant({String? hid, String? uid}) {
    this.hid = hid;
    this.uid = uid;
  }
}

void main() {
  group('HasStringIdMix', () {
    test('construct, empty HID, empty UID', () {
      final quant = Quant();
      expect(quant.hid, isEmpty);
      expect(quant.uid, isUuid);
      expect(quant.id, quant.uid);
    });

    test('construct, filled HID, empty UID', () {
      final quant = Quant(hid: 'aerwyna');
      expect(quant.hid, 'aerwyna');
      expect(quant.uid, isUuid);
      expect(quant.id, quant.hid);
    });

    test('construct, empty HID, filled UID', () {
      final quant = Quant(uid: '92e6ee3e-537a-4dd3-b4e9-06b8fd366469');
      expect(quant.hid, isEmpty);
      expect(quant.uid, '92e6ee3e-537a-4dd3-b4e9-06b8fd366469');
      expect(quant.id, quant.uid);
    });

    test('construct many', () {
      var prevUid = '';
      for (var i = 0; i < 4; ++i) {
        final quant = Quant();
        expect(quant.hid, isEmpty);
        expect(quant.uid, isUuid);
        expect(quant.uid, isNot(equals(prevUid)));
        expect(quant.id, quant.uid);
        prevUid = quant.uid;
      }
    });
  });
}
