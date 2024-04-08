import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [Status] objects.
extension StatusIterableExtensions on Iterable<Status> {
  /// Returns a list of the values of each [Status] in the iterable.
  List<String> get values => map((s) => s.value).toUnmodifiableList();
}
