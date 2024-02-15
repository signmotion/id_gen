import 'by.dart' as by;
import 'ru.dart' as ru;
import 'uk.dart' as uk;

final lowercaseMap = <String, String>{
  ...by.lowercaseMap,
  ...ru.lowercaseMap,
  ...uk.lowercaseMap,
};

final uppercaseMap = lowercaseMap
    .map((key, value) => MapEntry(key.toUpperCase(), value.toUpperCase()));

final map = <String, String>{
  ...lowercaseMap,
  ...uppercaseMap,
};
