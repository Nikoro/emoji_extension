import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [Group] objects.
extension GroupIterableExtensions on Iterable<Group> {
  /// Returns a list of the values of each [Group] in the iterable.
  List<String> get values => map((g) => g.value).toUnmodifiableList();
}
