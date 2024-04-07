import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [Color] objects.
extension ColorListExtensions on List<Color> {
  /// Returns a list of the values of each [Color] in the list.
  List<String> get values => map((c) => c.value).toUnmodifiableList();
}
