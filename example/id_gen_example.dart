// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';

void main() {
  {
    const gen = UuidV4Gen();
    for (var i = 0; i < 4; ++i) {
      print('id: ${gen.get()}');
    }
  }

  {
    const gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
    final id = gen.get('Тема статті чи назва курсу');
    print('id: $id');
  }
}
