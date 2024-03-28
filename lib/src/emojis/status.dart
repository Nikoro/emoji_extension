/// Enum representing the qualification status of an emoji.
/// See https://www.unicode.org/reports/tr51/#def_qualified_emoji_character
enum Status {
  /// Fully qualified emoji. See https://www.unicode.org/reports/tr51/#def_fully_qualified_emoji
  fullyQualified('fully-qualified'),

  /// Minimally qualified emoji. See https://www.unicode.org/reports/tr51/#def_minimally_qualified_emoji
  minimallyQualified('minimally-qualified'),

  /// Unqualified emoji. See https://www.unicode.org/reports/tr51/#def_unqualified_emoji
  unqualified('unqualified'),

  /// Component emoji. See https://www.unicode.org/reports/tr51/#def_level2_emoji
  component('component');

  /// Creates a new Status object with the given String value.
  const Status(this.value);

  /// Returns the status object that corresponds to the given string value.
  ///
  /// Throws a [StateError] if no matching status is found.
  factory Status.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The String value associated with this status.
  final String value;
}
