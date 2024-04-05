import 'package:emoji_extension/emoji_extension.dart';

/// An extension on [List] of [Shortcode] that provides methods for retrieving
/// shortcodes based on their platform.
extension ShortcodeListExtensions on List<Shortcode> {
  /// Returns the CLDR shortcode from the list of shortcodes.
  String get cldr => wherePlatform(Platform.CLDR)!;

  /// Returns the Discord shortcode from the list of shortcodes,
  /// or null if there isn't one.
  String? get discord => wherePlatform(Platform.Discord);

  /// Returns the GitHub shortcode from the list of shortcodes,
  /// or null if there isn't one.
  String? get github => wherePlatform(Platform.Github);

  /// Returns the Slack shortcode from the list of shortcodes,
  /// or null if there isn't one.
  String? get slack => wherePlatform(Platform.Slack);

  /// Returns the shortcode for the given [Platform] from the list of shortcodes,
  /// or null if there isn't one.
  String? wherePlatform(Platform platform) {
    final value =
        firstWhereOrNull((s) => s.platform == platform)?.values.firstOrNull;
    return value != null ? ':$value:' : null;
  }
}
