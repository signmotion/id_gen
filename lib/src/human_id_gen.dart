import 'chars_to_latin_maps/all.dart' as chars_to_latin_maps_all;
import 'extensions/string_ext.dart';
import 'id_gen_base.dart';

/// Short name for [HumanIdGen].
typedef HidGen = HumanIdGen;

/// Human ID generator.
class HumanIdGen extends IdGenBase<String> {
  const HumanIdGen({this.options = const HumanIdGenOptions()});

  final HumanIdGenOptions options;

  @override
  String get([dynamic source]) {
    var r = source as String;

    final replaces = options.replaces;
    for (final entry in replaces.entries) {
      r = r.replaceAll(entry.key, entry.value);
    }

    final removes = options.removes;
    for (final ch in removes) {
      r = r.replaceAll(ch, '');
    }

    // replace others non-word chars with separator
    final separator = options.separator;
    r = r.replaceAll(RegExp(r'[\W]+'), separator);

    if (options.squeezeRepeated) {
      r = r.removedDoubleChars;
    }

    if (options.trimSpacesInSource) {
      r = r.trim();
    }

    if (options.trimSeparatorsInSource) {
      r = r.replaceFirst(RegExp('^\\$separator+'), '');
      r = r.replaceFirst(RegExp('\\$separator+\$'), '');
    }

    if (options.lowerCase) {
      r = r.toLowerCase();
    } else if (options.upperCase) {
      r = r.toUpperCase();
    }

    return r;
  }

  @override
  String get next => throw UnimplementedError();
}

/// Short name for [HumanIdGenOptions].
typedef HidGenOptions = HumanIdGenOptions;

/// Options for [HumanIdGen].
class HumanIdGenOptions {
  const HumanIdGenOptions({
    this.separator = defaultSeparator,
    this.replaces = defaultConstReplaces,
    this.removes = defaultConstRemoves,
    this.squeezeRepeated = true,
    this.trimSpacesInSource = true,
    this.trimSeparatorsInSource = true,
    this.lowerCase = false,
    this.upperCase = false,
  }) : assert(
            lowerCase && !upperCase ||
                !lowerCase && upperCase ||
                !lowerCase && !upperCase,
            'Should be set one to `true` or both to `false`.');

  static const defaultSeparator = '-';

  /// Replaces for all supported languages.
  static final defaultLangReplaces = chars_to_latin_maps_all.map;

  /// Case sensitivity.
  static const Map<String, String> defaultConstReplaces = <String, String>{
    ' ': defaultSeparator,
    '_': defaultSeparator,
  };

  /// Case sensitivity.
  static final Map<String, String> defaultReplaces = {
    ...defaultLangReplaces,
    ...defaultConstReplaces
  };

  /// Case sensitivity.
  static const defaultConstRemoves = <String>[
    '"',
    '`',
    '”',
    '“',
    '\'',
  ];

  /// Case sensitivity.
  static const List<String> defaultRemoves = [...defaultConstRemoves];

  final String separator;

  /// These strings will be replaces.
  /// Doing it before processed [removes].
  /// Case sensitivity.
  final Map<String, String> replaces;

  /// These strings will be removed.
  /// Doing it after processed [replaces].
  /// Case sensitivity.
  final List<String> removes;

  /// Will replace a sequence of [defaultReplaces] characters to single
  /// character.
  /// Do it after processed [replaces] and [removes].
  final bool squeezeRepeated;

  /// After processing the source will be trimmed.
  final bool trimSpacesInSource;

  /// After processing the source will be trimmed.
  final bool trimSeparatorsInSource;

  /// After processing the source will be transform to lowercase.
  final bool lowerCase;

  /// After processing the source will be transform to lowercase.
  final bool upperCase;
}
