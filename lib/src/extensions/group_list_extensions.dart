import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [Group] objects.
extension GroupListExtensions on List<Group> {
  /// Returns a list of the values of each [Group] in the list.
  List<String> get values => map((g) => g.value).toUnmodifiableList();
}
