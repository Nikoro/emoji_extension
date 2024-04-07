part of '../emojis.dart';

/// Represents an Emoji.
/// An Emoji is characterized by its value, unicode, name, group, subgroup, and shortcodes.
/// @param value The value of the emoji as a String.
/// @param unicode The unicode representation of the emoji as a String.
/// @param name The name of the emoji as a String.
/// @param appleName The Apple name of the emoji as a nullable String.
/// @param alsoKnownAs The other names emoji is also known as a List of String.
/// @param group The group of the emoji as a Group enum.
/// @param subgroup The subgroup of the emoji as a Subgroup enum.
/// @param version The unicode version in which an emoji was introduced as a Version enum.
/// @param status The status of the emoji as a Status enum.
/// @param shortcodes The shortcodes of the emoji as a List of Shortcode objects.

class Emoji {
  /// Constructs an Emoji object with the specified properties.
  ///
  const Emoji._({
    required this.value,
    required this.unicode,
    required this.name,
    this.appleName,
    required this.alsoKnownAs,
    required this.group,
    required this.subgroup,
    required this.version,
    required this.status,
    required this.shortcodes,
  });

  factory Emoji(String value) {
    assert(
      EmojiParser(value).onlyOne,
      """
    
    Provided value must be a single emoji:
    ✅ emoji('😀') - valid
    ❌ emoji('😀😀') - invalid
    ❌ emoji('not an emoji') - invalid
    """,
    );
    return Emojis.getOne(value.trim());
  }

  /// The value of the emoji as a String.
  final String value;

  /// The unicode representation of the emoji as a String.
  final String unicode;

  /// The name of the emoji as a String.
  final String name;

  /// The Apple name of the emoji as a nullable String.
  final String? appleName;

  /// The list of names the emoji is also known as a List of String.
  final List<String> alsoKnownAs;

  /// The group of the emoji as a Group enum.
  final Group group;

  /// The subgroup of the emoji as a Subgroup enum.
  final Subgroup subgroup;

  /// The unicode version in which an emoji was introduced as a Version enum.
  final Version version;

  /// The status of the emoji as a Status enum.
  final Status status;

  /// The shortcodes of the emoji as a List of Shortcode objects.
  final List<Shortcode> shortcodes;

  /// Determines whether the current emoji is equal to another object.
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        // coverage:ignore-start
        (other.runtimeType == runtimeType &&
            other is Emoji &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unicode, unicode) || other.unicode == unicode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.appleName, appleName) ||
                other.appleName == appleName) &&
            const DeepCollectionEquality.unordered()
                .equals(other.alsoKnownAs, alsoKnownAs) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.subgroup, subgroup) ||
                other.subgroup == subgroup) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality.unordered()
                .equals(other.shortcodes, shortcodes));
    // coverage:ignore-end
  }

  /// Returns the hash code for the current emoji.
  @override
  int get hashCode => Object.hash(
        runtimeType,
        value,
        unicode,
        name,
        appleName,
        const DeepCollectionEquality().hash(alsoKnownAs),
        group,
        subgroup,
        version,
        status,
        const DeepCollectionEquality().hash(shortcodes),
      );

  /// Returns a String representation of the current emoji.
  @override
  String toString() {
    return 'Emoji(\n'
        '  value: $value,\n'
        '  unicode: $unicode,\n'
        '  name: $name,\n'
        '  appleName: $appleName,\n'
        '  alsoKnownAs: $alsoKnownAs,\n'
        '  group: ${group.value},\n'
        '  subgroup: ${subgroup.value},\n'
        '  version: ${version.value},\n'
        '  status: ${status.value},\n'
        '  shortcodes: $shortcodes\n'
        ')';
  }
}
