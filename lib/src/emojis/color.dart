/// Enum representing the color of an emoji.
enum Color {
  /// Red color of emoji.
  red('red'),

  /// Pink color of emoji.
  pink('pink'),

  /// Orange color of emoji.
  orange('orange'),

  /// Yellow color of emoji.
  yellow('yellow'),

  /// Green color of emoji.
  green('green'),

  /// Blue color of emoji.
  blue('blue'),

  /// Light blue color of emoji.
  lightBlue('light blue'),

  /// Purple color of emoji.
  purple('purple'),

  /// Brown color of emoji.
  brown('brown'),

  /// Black color of emoji.
  black('black'),

  /// Grey color of emoji.
  grey('grey'),

  /// White color of emoji.
  white('white');

  /// Creates a new Color object with the given String value.
  const Color(this.value);

  /// Returns the Color enum value that matches the given [value].
  ///
  /// If no match is found, this method throws a [StateError].
  factory Color.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The String value of the color.
  final String value;
}
