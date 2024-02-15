const lowercaseMap = <String, String>{
  'а': 'a',
  'б': 'b',
  'в': 'v',
  'г': 'h',
  'д': 'd',
  'е': 'e',
  'ё': 'yo',
  'ж': 'zh',
  'з': 'z',
  'і': 'i',
  'й': 'i',
  'к': 'k',
  'л': 'l',
  'м': 'm',
  'н': 'n',
  'о': 'o',
  'п': 'p',
  'р': 'r',
  'с': 's',
  'т': 't',
  'у': 'u',
  'ў': 'u',
  'ф': 'f',
  'х': 'kh',
  'ц': 'ts',
  'ч': 'ch',
  'ш': 'sh',
  'ы': 'y',
  'ь': '',
  'э': 'e',
  'ю': 'yu',
  'я': 'ya',
};

final uppercaseMap = lowercaseMap
    .map((key, value) => MapEntry(key.toUpperCase(), value.toUpperCase()));

final map = <String, String>{
  ...lowercaseMap,
  ...uppercaseMap,
};
