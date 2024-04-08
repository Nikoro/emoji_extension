import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for Iterable of [Version] objects.
extension VersionIterableExtensions on Iterable<Version> {
  /// Returns a list of the values of each [Version] in the iterable.
  List<double> get values => map((v) => v.value).toUnmodifiableList();
}
