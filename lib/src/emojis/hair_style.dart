/// Enum representing the hair style of an emoji.
enum HairStyle {
  /// Blond hair style of emoji.
  blond('1F471'),

  /// Red hair style of emoji.
  red('1F9B0'),

  /// Curly hair style tone of emoji.
  curly('1F9B1'),

  /// White hair style of emoji.
  white('1F9B3'),

  /// Bald hair style of emoji.
  bald('1F9B2');

  /// Creates a new HairStyle object with the given unicode as String value.
  const HairStyle(this.value);

  /// Returns the HairStyle enum value that matches the given [value].
  ///
  /// If no match is found, this method throws a [StateError].
  factory HairStyle.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The unicode value of the hair style as String.
  final String value;
}
