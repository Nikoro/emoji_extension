import 'package:collection/collection.dart';
import 'package:emoji_extension/src/emojis/group.dart';
import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';

/// Represents an Emoji.
/// An Emoji is characterized by its value, unicode, name, group, subgroup, and shortcodes.
/// @param value The value of the emoji as a String.
/// @param unicode The unicode representation of the emoji as a String.
/// @param name The name of the emoji as a String.
/// @param group The group of the emoji as a Group enum.
/// @param subgroup The subgroup of the emoji as a Subgroup enum.
/// @param shortcodes The shortcodes of the emoji as a List of Shortcode objects.

class Emoji {
  /// Constructs an Emoji object with the specified properties.
  const Emoji({
    required this.value,
    required this.unicode,
    required this.name,
    required this.group,
    required this.subgroup,
    required this.shortcodes,
  });

  /// The value of the emoji as a String.
  final String value;

  /// The unicode representation of the emoji as a String.
  final String unicode;

  /// The name of the emoji as a String.
  final String name;

  /// The group of the emoji as a Group enum.
  final Group group;

  /// The subgroup of the emoji as a Subgroup enum.
  final Subgroup subgroup;

  /// The shortcodes of the emoji as a List of Shortcode objects.
  final List<Shortcode> shortcodes;

  /// Returns the Unicode escape sequence for the emoji as a String.
  String toUnicodeEscapeSequence() {
    return String.fromCharCodes(value.runes)
        .codeUnits
        .map((unit) => "\\u${unit.toRadixString(16).toUpperCase()}")
        .join();
  }

  /// Returns the default shortcode of the emoji as a String.
  String get shortcode => shortcodes.wherePlatform(Platform.Default)!;

  /// Determines whether the current emoji is equal to another object.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Emoji &&
            runtimeType == other.runtimeType &&
            value == other.value &&
            unicode == other.unicode &&
            name == other.name &&
            group == other.group &&
            subgroup == other.subgroup &&
            const DeepCollectionEquality.unordered()
                .equals(shortcodes, other.shortcodes);
  }

  /// Returns the hash code for the current emoji.
  @override
  int get hashCode {
    return value.hashCode ^
        unicode.hashCode ^
        name.hashCode ^
        group.hashCode ^
        subgroup.hashCode ^
        const DeepCollectionEquality().hash(shortcodes);
  }

  /// Returns a String representation of the current emoji.
  @override
  String toString() {
    return 'Emoji(\n'
        '  value: $value,\n'
        '  unicode: $unicode,\n'
        '  name: $name,\n'
        '  group: ${group.value},\n'
        '  subgroup: ${subgroup.value},\n'
        '  shortcodes: $shortcodes\n'
        ')';
  }
}
