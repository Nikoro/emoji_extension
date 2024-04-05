/// An extension on the [String] class providing various helper functions.
extension StringExtensions on String {
  /// Returns a modified version of the string, with leading and trailing colons removed.
  /// If the string does not start or end with a colon, returns the original string.
  /// Example: ':smile:' becomes 'smile'.
  String removeColons() => replaceAll(RegExp(r'^:|:$'), '');

  bool containsIgnoreCase(String other) {
    return toLowerCase().contains(other.toLowerCase());
  }

  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }

  String wrapWithColons() => ':$this:';
}
