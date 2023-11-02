import 'by.dart' as by;
import 'ru.dart' as ru;
import 'uk.dart' as uk;

final Map<String, String> lowercaseMap = <String, String>{
  ...by.lowercaseMap,
  ...ru.lowercaseMap,
  ...uk.lowercaseMap,
};

final Map<String, String> uppercaseMap = lowercaseMap
    .map((key, value) => MapEntry(key.toUpperCase(), value.toUpperCase()));

final Map<String, String> map = <String, String>{
  ...lowercaseMap,
  ...uppercaseMap,
};
