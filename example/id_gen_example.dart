// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';

void main() {
  // generate random UUIDs
  {
    const gen = UuidV4Gen();
    for (var i = 0; i < 4; ++i) {
      print(gen.get());
    }
  }

  // generate HID from Ukrainian
  {
    const gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
    final hid = gen.get('Тема статті чи назва курсу');
    print(hid);
  }
}
