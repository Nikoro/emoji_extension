import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [HairStyle] objects.
extension HairStyleListExtensions on List<HairStyle> {
  /// Returns a list of the values of each [HairStyle] in the list.
  List<String> get values => map((c) => c.value).toUnmodifiableList();
}
