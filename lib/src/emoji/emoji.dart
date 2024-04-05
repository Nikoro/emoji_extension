import 'package:emoji_extension/emoji_extension.dart';

part 'emoji_getters.dart';

part 'emoji_methods.dart';

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
  const Emoji({
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
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o.runtimeType == runtimeType &&
          o is Emoji &&
          (identical(o.value, value) || o.value == value) &&
          (identical(o.unicode, unicode) || o.unicode == unicode) &&
          (identical(o.name, name) || o.name == name) &&
          (identical(o.appleName, appleName) || o.appleName == appleName) &&
          const DeepCollectionEquality.unordered()
              .equals(o.alsoKnownAs, alsoKnownAs) &&
          (identical(o.group, group) || o.group == group) &&
          (identical(o.subgroup, subgroup) || o.subgroup == subgroup) &&
          (identical(o.version, version) || o.version == version) &&
          (identical(o.status, status) || o.status == status) &&
          const DeepCollectionEquality.unordered()
              .equals(o.shortcodes, shortcodes));

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
