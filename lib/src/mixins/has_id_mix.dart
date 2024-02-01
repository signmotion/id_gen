import 'package:meta/meta.dart';

import '../extensions/uuid_ext.dart';
import '../helpers/uuid.dart';

/// Mixin for object with [String] ID.
mixin HasStringIdMix on Object {
  /// Human ID for nicely detection.
  /// Trimming spaces into setter.
  /// Generate an empty string when set to null.
  String? _hid;

  String get hid => _hid ??= '';

  set hid(String? v) => _hid = v?.trim() ?? '';

  bool get hasHid => hid.isNotEmpty;

  bool get isCorrectHid => RegExp(r'^[a-z0-9_]*$').hasMatch(hid);

  /// UUID.
  /// Trimming spaces into setter.
  /// Generate a UUID when set to null.
  String? _uid;

  String get uid => _uid == null || _uid!.isEmpty ? _uid = genUuid : _uid!;

  set uid(String? v) => _uid = v?.trim() ?? genUuid;

  bool get hasUid => uid.isNotEmpty;

  bool get isCorrectUid => uid.isUuid;

  /// ID for access to object.
  @mustCallSuper
  String get id => hid.isEmpty ? uid : hid;

  /// Auto-detect to set [uid] or [hid].
  set id(String uidOrHid) => uidOrHid.isUuid ? uid = uidOrHid : hid = uidOrHid;
}
