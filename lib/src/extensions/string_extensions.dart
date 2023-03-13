/// An extension on the [String] class providing various helper functions.
extension StringExtensions on String {
  /// Returns a modified version of the string, with skin tone modifiers in CLDR format.
  /// The method maps common skin tone modifier substrings to the corresponding integer tone value
  /// and replaces the modifier with '_toneX', where X is the corresponding tone value.
  /// Example: 'raised_hand_medium_skin_tone' becomes 'raised_hand_tone3'.
  String toCLDR() {
    final skinTones = {
      '_medium_light_skin_tone': 2,
      '_medium_skin_tone': 3,
      '_medium_dark_skin_tone': 4,
      '_light_skin_tone': 1,
      '_dark_skin_tone': 5,
    };

    final input = toSnakeCase();
    for (final tone in skinTones.keys) {
      if (input.endsWith(tone)) {
        return input.replaceRange(
            input.lastIndexOf(tone), input.length, '_tone${skinTones[tone]}');
      }
    }

    return input;
  }

  /// Returns a snake case version of the string.
  /// Replaces any non-word and non-underscore characters with underscores,
  /// and converts the string to lowercase.
  /// Example: 'Hello, World!' becomes 'hello_world'.
  String toSnakeCase() => replaceAll(RegExp(r'[\W_]+'), '_').toLowerCase();

  /// Returns a modified version of the string, with leading and trailing colons removed.
  /// If the string does not start or end with a colon, returns the original string.
  /// Example: ':smile:' becomes 'smile'.
  String removeColons() => replaceAll(RegExp(r'^:|:$'), '');
}
