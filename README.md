# ID Generators

![Cover - ID Generators](https://raw.githubusercontent.com/signmotion/id_gen/master/images/cover.webp)

The standartized and well-tested set for generate identifiers.

## Examples

### Generate 4 UUIDs

About UUID (online generator): <https://uuidgenerator.net>

```dart
const gen = UuidV4Gen();
for (var i = 0; i < 4; ++i) {
    print(gen.get());
}
```

Output:

```sh
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

Output:

```sh
tema-stati-chy-nazva-kursu
```

### Generate Transit Integer ID

```dart
final id = TransitIdGen();
print(id.get());
// or
print(id.next);
```

Output:

```sh
1
2
```

## License

[MIT](LICENSE)

## TODO

- Feautures for this package into README.
- Example of HID generation in your own language.
- More predefined languages. See <https://github.com/bengourley/slugg/blob/master/slugg.js>
