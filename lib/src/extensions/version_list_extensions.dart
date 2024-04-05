import 'package:emoji_extension/emoji_extension.dart';

/// Extension methods for List of [Version] objects.
extension VersionListExtensions on List<Version> {
  /// Returns a list of the values of each [Version] in the list.
  List<double> get values => map((v) => v.value).toUnmodifiableList();
}
