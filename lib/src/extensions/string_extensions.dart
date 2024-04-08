/// An extension on the [String] class providing various helper functions.
extension StringExtensions on String {
  /// Returns a modified version of the string, with leading and trailing colons removed.
  /// If the string does not start or end with a colon, returns the original string.
  /// Example: ':smile:' becomes 'smile'.
  String removeColons() => replaceAll(RegExp(r'^:|:$'), '');

  /// Checks if the string contains the specified [other] string, ignoring case.
  /// Returns `true` if the string contains [other] ignoring case, otherwise `false`.
  /// Example: 'Hello World'.containsIgnoreCase('hello') returns true.
  bool containsIgnoreCase(String other) {
    return toLowerCase().contains(other.toLowerCase());
  }

  /// Checks if the string is equal to the specified [other] string, ignoring case.
  /// Returns `true` if the string is equal to [other] ignoring case, otherwise `false`.
  /// Example: 'HELLO'.equalsIgnoreCase('hello') returns true.
  bool equalsIgnoreCase(String other) {
    return toLowerCase() == other.toLowerCase();
  }

  /// Wraps the string with leading and trailing colons.
  /// Example: 'smile'.wrapWithColons() returns ':smile:'.
  String wrapWithColons() => ':$this:';
}
