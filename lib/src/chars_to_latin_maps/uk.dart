const Map<String, String> lowercaseMap = <String, String>{
  'а': 'a',
  'б': 'b',
  'в': 'v',
  'г': 'h',
  'ґ': 'g',
  'д': 'd',
  'е': 'e',
  'є': 'ie',
  'ж': 'zh',
  'з': 'z',
  'и': 'y',
  'і': 'i',
  'ї': 'i',
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
  'ф': 'f',
  'х': 'kh',
  'ц': 'ts',
  'ч': 'ch',
  'ш': 'sh',
  'щ': 'shch',
  'ь': '',
  'ю': 'iu',
  'я': 'ia',
  '\'': '',
};

final Map<String, String> uppercaseMap = lowercaseMap
    .map((key, value) => MapEntry(key.toUpperCase(), value.toUpperCase()));

final Map<String, String> map = <String, String>{
  ...lowercaseMap,
  ...uppercaseMap,
};
