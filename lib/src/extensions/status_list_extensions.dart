import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [Status] objects.
extension StatusListExtensions on List<Status> {
  /// Returns a list of the values of each [Status] in the list.
  List<String> get values => map((v) => v.value).toUnmodifiableList();
}
