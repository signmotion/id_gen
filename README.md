# ID Generators

![Cover - ID Generators](https://raw.githubusercontent.com/signmotion/id_gen/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/id_gen.svg?logo=dart&logoColor=00b9fc&color=blue)](https://pub.dartlang.org/packages/id_gen)
[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/id_gen/dart-ci.yml?logo=github-actions&logoColor=white)](https://github.com/signmotion/id_gen/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/id_gen?logo=github&logoColor=white)](https://github.com/signmotion/id_gen/pulls)
[![Pub Score](https://img.shields.io/pub/points/id_gen?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/id_gen/score)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/id_gen?logo=github&logoColor=white)](https://github.com/signmotion/id_gen)
[![Publisher](https://img.shields.io/pub/publisher/id_gen)](https://pub.dev/publishers/syrokomskyi.com)

The standartized, easy-to-use and well-tested set for generate identifiers: globally unique, readable,
time-dependency, transitive, incremental, decremental IDs.
Feel free to use it in your awesome project.

Share some ❤️ and star repo to support the project.

## Usage

### Generate 4 UUIDs

About UUID (online generator): <https://uuidgenerator.net>

```dart
for (var i = 0; i < 4; ++i) {
  print(genUuid);
}
```

```text
490833da-4976-4563-8c8a-9f5464a2bf7e
e82e3bf5-c3ea-46d6-a835-12644b99cf6e
4d86c01f-777b-4599-b28f-c87c3737c8e2
60fc6015-417e-4548-adaa-b032b1f7dbcd
```

### Generate HID from language

Supported languages:

- Belarusian
- English
- Ukrainian

```dart
const gen = HumanIdGen(options: HumanIdGenOptions(lowerCase: true));
final hid = gen.get('Тема статті чи назва курсу');
print(hid);
```

```text
tema-stati-chy-nazva-kursu
```

### Generate Transit Integer ID

```dart
print(genTransitId);
// or
print(TransitId().next);
```

```text
1
2
```

### Generate Time Integer ID

```dart
print(genTimeId);
// or
print(genTimeIdMicro);
```

```text
1705954581187
1705954581188687
```

Note that second ID does not fit into 53 bits (the size of a IEEE double). A JavaScript number is not able to hold this value.

### Add HID and UID to Any Class

```dart
class Quant with HasStringIdMix {
  Quant({String? hid, String? uid}) {
    this.hid = hid;
    this.uid = uid;
  }
}

print(Quant().id);
print(Quant(hid: 'aerwyna').id);
```

```text
92e6ee3e-537a-4dd3-b4e9-06b8fd366469
aerwyna
```

## Welcome

Requests and suggestions are warmly welcome.

This package is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/id_gen). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/id_gen).

## TODO

- Feautures for this package into README.
- Example of HID generation in your own language.
- More predefined languages. See <https://github.com/bengourley/slugg/blob/master/slugg.js>

---

Created [with ❤️](https://syrokomskyi.com)
