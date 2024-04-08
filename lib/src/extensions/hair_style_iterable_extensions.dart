import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [HairStyle] objects.
extension HairStyleIterableExtensions on Iterable<HairStyle> {
  /// Returns a list of the values of each [HairStyle] in the iterable.
  List<String> get values => map((h) => h.value).toUnmodifiableList();
}
