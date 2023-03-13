import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';

/// Extension methods for List of [Subgroup] objects.
extension SubgroupListExtensions on List<Subgroup> {
  /// Returns a list of the values of each [Subgroup] in the list.
  List<String> get values => map((s) => s.value).toUnmodifiableList();
}
