// ignore_for_file: constant_identifier_names

/// Enum representing platforms where emojis can be used.
///
/// Each platform has a unique value associated with it. This enum provides
/// a way to convert between string values and platform objects.
enum Platform {
  Default('default'),
  CLDR('cldr'),
  Discord('discord'),
  Github('github'),
  Slack('slack');

  /// Creates a new Platform object with the given String value.
  const Platform(this.value);

  /// Returns the platform object that corresponds to the given string value.
  ///
  /// Throws a [StateError] if no matching platform is found.
  factory Platform.from(String value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The String value associated with this platform.
  final String value;
}
