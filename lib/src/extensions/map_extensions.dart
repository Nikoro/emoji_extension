import 'package:emoji_extension/emoji_extension.dart';

/// Provides extension methods for a [Map] with [String] keys and [String] values.
extension StringStringMapExtensions on Map<String, String> {
  /// Returns a [Map] where the keys are only emojis and the values are their corresponding strings.
  ///
  /// This method creates a new [Map] from this [Map], then removes any key-value pairs
  /// where the key is not an emoji. The resulting [Map] contains only key-value pairs
  /// where the key is an emoji.
  Map<String, String> toMapWhereKeysAreEmojisOnly() {
    return {...this}..removeWhere((key, _) => !key.emojis.only);
  }
}
