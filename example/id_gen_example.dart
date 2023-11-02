// ignore_for_file: avoid_print

import 'package:id_gen/id_gen.dart';

void main() {
  {
    final id = const UuidV5Gen().get();
    print('id: $id');
  }

  {
    const gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
    final id = gen.get('Тема статті чи назва курсу');
    print('id: $id');
  }
}
