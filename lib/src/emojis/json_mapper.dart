part of 'emojis.dart';

/// Extension methods for [Map]s containing JSON data that can be used to
/// convert the data to an [Emoji] object.
extension _JsonMapper on Map<String, dynamic> {
  /// Converts a [Map] containing JSON data to an [Emoji] object.
  ///
  /// Extracts the values for [unicode], [value], [name], [group],
  /// and [subgroup] from the JSON [Map], and creates a list of [Shortcode]
  /// objects from the JSON data in the [shortcodes] key.
  /// Finally, constructs and returns an [Emoji] object using the extracted
  /// values and the list of shortcodes.
  Emoji toEmoji() {
    final unicode = this['unicode'] as String;
    final value = this['value'] as String;
    final name = this['name'] as String;
    final group = this['group'] as String;
    final subgroup = this['subgroup'] as String;

    final shortcodes = (this['shortcodes'] as Map<String, dynamic>)
        .entries
        .map((e) => Shortcode(platform: e.key, values: <String>[...e.value]))
        .toList()
      ..add(Shortcode.$default([name.toSnakeCase()]))
      ..add(Shortcode.cldr([name.toCLDR()]));
    return Emoji(
      value: value,
      unicode: unicode,
      name: name,
      group: Group.from(group),
      subgroup: Subgroup.from(subgroup),
      shortcodes: shortcodes,
    );
  }
}
