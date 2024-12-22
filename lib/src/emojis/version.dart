/// Enum representing the Unicode version in which an emoji was introduced.
/// See https://www.unicode.org/reports/tr51/#EmojiVersions
enum Version {
  /// Representation of Unicode 6.0
  v6_0(6.0),

  /// Representation of Unicode 7.0
  v7_0(7.0),

  /// Representation of Unicode 8.0
  v8_0(8.0),

  /// Representation of Unicode 9.0
  v9_0(9.0),

  /// Representation of Unicode 10.0
  v10_0(10.0),

  /// Representation of Unicode 11.0
  v11_0(11.0),

  /// Representation of Unicode 12.0
  v12_0(12.0),

  /// Representation of Unicode 12.1
  v12_1(12.1),

  /// Representation of Unicode 13.0
  v13_0(13.0),

  /// Representation of Unicode 13.0
  v13_1(13.1),

  /// Representation of Unicode 14.0
  v14_0(14.0),

  /// Representation of Unicode 15.0
  v15_0(15.0),

  /// Representation of Unicode 15.1
  v15_1(15.1),

  /// Representation of Unicode 16.0
  v16_0(16.0);

  /// Creates a new Status object with the given String value.
  const Version(this.value);

  /// Returns the status object that corresponds to the given string value.
  ///
  /// Throws a [StateError] if no matching status is found.
  factory Version.from(double value) {
    return values.firstWhere((v) => v.value == value);
  }

  /// The  value associated with this unicode version.
  final double value;
}
