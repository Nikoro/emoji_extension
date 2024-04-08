import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [Color] objects.
extension ColorIterableExtensions on Iterable<Color> {
  /// Returns a list of the values of each [Color] in the iterable.
  List<String> get values => map((c) => c.value).toUnmodifiableList();
}
