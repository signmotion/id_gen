# Changelog

All notable changes to the project `IdGen` will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 0.7.8

- Provided a link to [webduet.de](https://webduet.de "The Modern Planet-Scale Site for Your Ambitions") into `README`.
- Enhanced [Fresher's badge](https://github.com/signmotion/fresher).
- Upgraded dependencies.

## 0.7.7

- Changed the style for shields in `README`.
- Added a link to [Awesome Flutter](https://github.com/Solido/awesome-flutter) in `example/README`.
- Stabilized CI for tests.
- Excluded some folders from the analysis.
- Updated cover.

## 0.7.6

- Enhanced `README`: added an opening speech in Welcome section, What's New section, shorted sentences, etc.
- Simplified examples.
- Replaced badges with supported platforms to <https://badgen.net/pub>.
- Added TODO: HID. A desire case convention.
- Removed a table of content from `README`. Reason: The links to sections doesn't work on github.
- Added note to `pubspec.yaml` about version: compatible with <https://semver.org>.
- Upgraded dependencies.

## 0.7.5

- Added a link to [CodeTriangle](https://codetriage.com) in `README`.
- Provided CodeFactor badge in `README`.
- Added emojis to **Usage** and **Welcome** sections in `README`.
- Changed a representation of supported platforms and SDKs in `README`.
- Removed unnecessary type declarations.

## 0.7.4

- Fixed omission of some options during HID generation.
- Enhanced tests.
- Improved examples.

## 0.7.3

- Added a help for first-time contributor in `README`.
- Provided supported platforms.
- Included a link to tests from `README`.

## 0.7.2

- Added badges to `README`.

## 0.7.1

- Added CI for GitHub.
- Included some badges to `README`.

## 0.7.0

- Introduced `HasIdMix.same()`.

## 0.6.2

- Updated `README`.

## 0.6.1

- `HumanIdGen`. Fixed an ignore character '\_' when separator is not '\_'.
- Added a configuration for markdown linter.
- Fixed link to issues in `CONTRIBUTING`.

## 0.6.0

- Added `separator` to `HumanIdGen`.

## 0.5.0

- Introduced `stringBittenOfReplacer`, `uuidBittenOfReplacer` and `uuidPrefixSeparator` extensions.
- Introduced `HasStringIdMix.isCorrectHid`.
- Updated `LICENSE`, `README`, `SECURITY` and description of package.
- Upgraded dependencies.

## 0.4.1

- Added more tests to `HasStringIdMix`.

## 0.4.0

- Introduced `HasStringIdMix` for adding a Human and Unique IDs to objects.
- Updated `README`.

## 0.3.0

- Introduced `TimeId` for generate IDs in milli- and microseconds.
- Introduced helpers for concisely generate IDs: `genUuid`, `genTransitId`, `genTimeId`, `genTimeIdMicro`.
- Removed alias `TidGen` for `TransitIdGen`.
- Updated example.
- Updated `README`.

## 0.2.1

- Shorted `UuidV4Gen` to `UuidGen` (as alias).

## 0.2.0

- Introduced `TransitId` and `TransitIdGen`.
- Updated `README`.
- Improved example.
- Added `CODE_OF_CONDUCT`, `CONTRIBUTING`, and `STYLEGUIDE`.

## 0.1.0

- Initial release.
