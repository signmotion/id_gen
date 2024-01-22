// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';
import 'package:id_gen/id_gen_helpers.dart';

void main() {
  // generate random UUIDs, helper
  {
    for (var i = 0; i < 4; ++i) {
      print(genUuid);
    }
  }

  // generate random UUIDs, native
  {
    const gen = UuidGen();
    for (var i = 0; i < 4; ++i) {
      print(gen.next);
    }
  }

  // generate HID from Ukrainian
  {
    const gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
    final hid = gen.get('Тема статті чи назва курсу');
    print(hid);
  }

  // generate increasing unique integer ID, helper
  {
    print(TransitIdGen().get());
    // or
    print(genTransitId);
  }

  // generate decreasing unique integer ID
  {
    final gen = TransitIdGen(1050, -50);
    print(gen.get());
  }

  // generate time IDs in milliseconds, helper
  {
    for (var i = 0; i < 4; ++i) {
      print(genTimeId);
    }
  }

  // generate time IDs in microseconds, helper
  {
    for (var i = 0; i < 4; ++i) {
      print(genTimeIdMicro);
    }
  }
}
