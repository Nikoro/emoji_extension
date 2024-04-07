import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [SkinTone] objects.
extension SkinToneListExtensions on List<SkinTone> {
  /// Returns a list of the values of each [SkinTone] in the list.
  List<String> get values => map((c) => c.value).toUnmodifiableList();
}
