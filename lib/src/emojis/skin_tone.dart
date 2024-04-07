/// Enum representing the skin tone of an emoji.
enum SkinTone {
  /// Light skin tone of emoji.
  light('1F3FB'),

  /// Medium light skin tone of emoji.
  mediumLight('1F3FC'),

  /// Medium skin tone of emoji.
  medium('1F3FD'),

  /// Medium dark skin tone of emoji.
  mediumDark('1F3FE'),

  /// Dark skin tone of emoji.
  dark('1F3FF');

  /// Creates a new SkinTone object with the given unicode as String value.
  const SkinTone(this.value);

  /// Returns the SkinTone enum value that matches the given [value].
  ///
  /// If no match is found, this method throws a [StateError].
  factory SkinTone.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The unicode value of the skin tone as String.
  final String value;
}
