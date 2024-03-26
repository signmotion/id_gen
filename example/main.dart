// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_helpers.dart';

void main() {
  print('\ngenerate random UUIDs, helper');
  {
    print([for (var i = 0; i < 4; ++i) genUuid]);
  }

  print('\ngenerate random UUIDs, native');
  {
    const gen = UuidGen();
    print([for (var i = 0; i < 4; ++i) gen.next]);
    // or
    print([for (var i = 0; i < 4; ++i) genUuid]);
  }

  print('\ngenerate HID from Ukrainian');
  {
    final gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
    final hid = gen.get('Тема статті чи назва курсу');
    print(hid);
  }

  print('\ngenerate increasing unique integer ID, helper');
  {
    final gen = TransitIdGen();
    print([for (var i = 0; i < 4; ++i) gen.next]);
    // or
    print([for (var i = 0; i < 4; ++i) genTransitId]);
  }

  print('\ngenerate decreasing unique integer ID');
  {
    final gen = TransitIdGen(1050, -50);
    print([for (var i = 0; i < 4; ++i) gen.next]);
  }

  print('\ngenerate time IDs in milliseconds, helper');
  {
    for (var i = 0; i < 4; ++i) {
      print(genTimeId);
    }
  }

  print('\ngenerate time IDs in microseconds, helper');
  {
    for (var i = 0; i < 4; ++i) {
      print(genTimeIdMicro);
    }
  }
}
