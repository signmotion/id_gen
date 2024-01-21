// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';

void main() {
  // generate random UUIDs
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

  // generate increasing unique integer ID
  {
    final gen = TransitIdGen();
    print(gen.get());
    // or
    final id = TransitId();
    print(id.next);
  }

  // generate deccreasing unique integer ID
  {
    final gen = TransitIdGen(1050, -50);
    print(gen.get());
  }
}
