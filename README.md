# ID Generators

![Cover - ID Generators](https://raw.githubusercontent.com/signmotion/id_gen/master/images/cover.webp)

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub Package](https://img.shields.io/pub/v/id_gen.svg?logo=dart&logoColor=00b9fc&color=blue)](https://pub.dartlang.org/packages/id_gen)
[![Code Size](https://img.shields.io/github/languages/code-size/signmotion/id_gen?logo=github&logoColor=white)](https://github.com/signmotion/id_gen)
[![Publisher](https://img.shields.io/pub/publisher/id_gen)](https://pub.dev/publishers/syrokomskyi.com)

[![Build Status](https://img.shields.io/github/actions/workflow/status/signmotion/id_gen/dart-ci.yml?logo=github-actions&logoColor=white)](https://github.com/signmotion/id_gen/actions)
[![Pull Requests](https://img.shields.io/github/issues-pr/signmotion/id_gen?logo=github&logoColor=white)](https://github.com/signmotion/id_gen/pulls)
[![Issues](https://img.shields.io/github/issues/signmotion/id_gen?logo=github&logoColor=white)](https://github.com/signmotion/id_gen/issues)
[![Pub Score](https://img.shields.io/pub/points/id_gen?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/id_gen/score)

The standardized, easy-to-use and [well-tested](https://github.com/signmotion/id_gen/tree/master/test) set for generate identifiers: globally unique, readable, time-dependency, transitive, incremental, decremental IDs.
Feel free to use it in your awesome project.

[![CodeFactor](https://codefactor.io/repository/github/signmotion/id_gen/badge)](https://codefactor.io/repository/github/signmotion/id_gen)

| Android | iOS | Linux | MacOS | Web | Windows |
| :-----: | :-: | :---: | :---: | :-: | :-----: |
|   ✅    | ✅  |  ✅   |  ✅   | ✅  |   ✅    |

| Flutter | Dart |
| :-----: | :--: |
|   ✅    |  ✅  |

Share some ❤️ and star repo to support the project.

_If you write an article about **IdGen** or any of [these](https://pub.dev/packages?q=publisher%3Asyrokomskyi.com&sort=updated) packages, let me know and I'll post the URL of the article in the **README** 🤝_

## 🚀Usage

### Generate 4 UUIDs

About UUID and online generator: <https://uuidgenerator.net>

```dart
print([for (var i = 0; i < 4; ++i) genUuid]);
```

```text
[4c48329b-2c1b-4534-b649-1a462626bcd4, a1afafe2-d57a-46ae-9f27-7e42dc936475,
283ae055-cf4e-4d6d-b505-e2a7d60806d2, 843832d1-d0f0-48e7-8a61-3aa151c2103b]
```

### Generate HumanID from Language

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
print([for (var i = 0; i < 4; ++i) genTransitId]);
```

```text
[1, 2, 3, 4]
```

### Generate Time Integer ID

```dart
// milliseconds
print(genTimeId);
// microseconds
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

## Whats New

Look at [changelog](https://pub.dev/packages/id_gen/changelog).

## 🙋‍♀️🙋‍♂️Welcome

Requests and suggestions are warmly welcome.

Contributions are what make the open-source community such a great place to learn, create, take a new skills, and be inspired.

If this is your first contribution, I'll leave you with some of the best links I've found: they will help you get started or/and become even more efficient.

- [Guide to Making a First Contribution](https://github.com/firstcontributions/first-contributions). You will find the guide in your native language.
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute). Longread for deep diving for first-timers and for veterans.
- [Summer Guide from Google](https://youtu.be/qGTQ7dEZXZc).
- [CodeTriangle](https://codetriage.com) Free community tools for contributing to Open Source projects.

The package **IdGen** is open-source, stable and well-tested. Development happens on
[GitHub](https://github.com/signmotion/id_gen). Feel free to report issues
or create a pull-request there.

General questions are best asked on
[StackOverflow](https://stackoverflow.com/questions/tagged/id_gen).

And here is a curated list of how you can help:

- Documenting the undocumented. Whenever you come across a class, property, or method within our codebase that you're familiar with and notice it lacks documentation, kindly spare a couple of minutes to jot down some helpful notes for your fellow developers.
- Refining the code. While I'm aware it's primarily my responsibility to refactor the code, I wholeheartedly welcome any contributions you're willing to make in this area. Your insights and improvements are appreciated!
- Constructive code reviews. Should you discover a more efficient approach to achieve something, I'm all ears. Your suggestions for enhancement are invaluable.
- Sharing your examples. If you've experimented with our use cases or have crafted some examples of your own, feel free to add them to the `example` directory. Your practical insights can enrich our resource pool.
- Fix typos/grammar mistakes.
- Report bugs and scenarios that are difficult to implement.
- Implement new features by making a pull-request (look below).

## 🕧TODO (perhaps)

Once you start using the **IdGen**, it will become easy to choose the functionality to contribute. But if you already get everything you need from this package but have some free time, let me write here what I have planned:

- Feautures for this package into README.
- Example of HID generation in your own language.
- More predefined languages. See <https://github.com/bengourley/slugg/blob/master/slugg.js>

It's just a habit of mine: writing down ideas that come to mind while working on a project. I confess that I rarely return to these notes. But now, hopefully, even if you don't have an idea yet, the above notes will help you choose the suitable "feature" and become a contributor to the open-source community.

Created [with ❤️](https://syrokomskyi.com)
