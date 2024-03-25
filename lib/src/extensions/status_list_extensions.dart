import 'package:emoji_extension/src/emojis/status.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';

/// Extension methods for List of [Status] objects.
extension StatusListExtensions on List<Status> {
  /// Returns a list of the values of each [Status] in the list.
  List<String> get values => map((v) => v.value).toUnmodifiableList();
}
