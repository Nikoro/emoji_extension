part of 'emoji.dart';

/// Extension providing various utility methods for Emoji class.
extension EmojiMethods on Emoji {
  /// Returns the Unicode escape sequence for the emoji as a String.
  String toUnicodeEscapeSequence() {
    return String.fromCharCodes(value.runes)
        .codeUnits
        .map((unit) => "\\u${unit.toRadixString(16).toUpperCase()}")
        .join();
  }
}
