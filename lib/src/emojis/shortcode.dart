import 'package:collection/collection.dart';
import 'package:emoji_extension/src/emojis/platform.dart';

/// Represents a shortcode that maps to an emoji on a specific platform.
class Shortcode {
  /// Creates a shortcode instance with the given [platform] and [values].
  Shortcode._({required this.platform, required this.values});

  /// Creates a default shortcode with the given [values].
  const Shortcode.$default(this.values) : platform = Platform.Default;

  /// Creates a CLDR shortcode with the given [values].
  const Shortcode.cldr(this.values) : platform = Platform.CLDR;

  /// Creates a Discord shortcode with the given [values].
  const Shortcode.discord(this.values) : platform = Platform.Discord;

  /// Creates a Github shortcode with the given [values].
  const Shortcode.github(this.values) : platform = Platform.Github;

  /// Creates a Slack shortcode with the given [values].
  const Shortcode.slack(this.values) : platform = Platform.Slack;

  /// The platform associated with this shortcode.
  final Platform platform;

  /// The values of this shortcode.
  final List<String> values;

  /// Returns a new [Shortcode] object with updated properties.
  Shortcode copyWith({
    Platform? platform,
    List<String>? values,
  }) {
    return Shortcode._(
      platform: platform ?? this.platform,
      values: values ?? this.values,
    );
  }

  /// Determines whether the current shortcode is equal to another object.
  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o.runtimeType == runtimeType &&
          o is Shortcode &&
          (identical(o.platform, platform) || o.platform == platform) &&
          const DeepCollectionEquality.unordered().equals(o.values, values));

  /// Returns the hash code for the current shortcode.
  @override
  int get hashCode => Object.hash(
        runtimeType,
        platform,
        const DeepCollectionEquality().hash(values),
      );

  /// Returns a String representation of the current shortcode.
  @override
  String toString() {
    return '\n    Shortcode(\n'
        '    platform: ${platform.name},\n'
        '    values: $values\n'
        '  )';
  }
}
