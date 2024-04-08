import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/extensions/string_extensions.dart';

/// An extension on [Iterable] of [Shortcode] that provides methods for retrieving
/// shortcodes based on their platform.
extension ShortcodeIterableExtensions on Iterable<Shortcode> {
  /// Returns the CLDR shortcode list from the iterable of shortcodes.
  List<String> get cldr => wherePlatform(Platform.CLDR);

  /// Returns the Discord shortcode list from the iterable of shortcodes,
  /// or null if there isn't one.
  List<String> get discord => wherePlatform(Platform.Discord);

  /// Returns the GitHub shortcode list from the iterable of shortcodes,
  /// or null if there isn't one.
  List<String> get github => wherePlatform(Platform.Github);

  /// Returns the Slack shortcode list from the iterable of shortcodes,
  List<String> get slack => wherePlatform(Platform.Slack);

  /// Returns a list of shortcodes filtered based on the specified platform.
  List<String> wherePlatform(Platform platform) {
    return (firstWhereOrNull((s) => s.platform == platform)?.values ?? [])
        .map((s) => s.wrapWithColons())
        .toUnmodifiableList();
  }
}
