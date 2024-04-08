import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [SkinTone] objects.
extension SkinToneIterableExtensions on Iterable<SkinTone> {
  /// Returns a list of the values of each [SkinTone] in the iterable.
  List<String> get values => map((s) => s.value).toUnmodifiableList();
}
