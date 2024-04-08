import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [Subgroup] objects.
extension SubgroupIterableExtensions on Iterable<Subgroup> {
  /// Returns a list of the values of each [Subgroup] in the iterable.
  List<String> get values => map((s) => s.value).toUnmodifiableList();
}
