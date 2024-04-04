import 'package:emoji_extension/emoji_extension.dart';

/// Extension that provides several getters to extract specific data from the list of emojis.
extension EmojiListExtensions on List<Emoji> {
  /// Provides a list of all emoji values.
  List<String> get values => map((e) => e.value).toUnmodifiableList();

  /// Provides a list of all unicode representations of the emojis.
  List<String> get unicodes => map((e) => e.unicode).toUnmodifiableList();

  /// Provides a list of all the names of the emojis.
  List<String> get names => map((e) => e.name).toUnmodifiableList();

  /// Provides a list of all the apple names of the emojis.
  List<String> get appleNames =>
      mapNotNull((e) => e?.appleName).toUnmodifiableList();

  /// Provides a list of names each emoji is also known as.
  List<String> get alsoKnownAs =>
      expand((e) => e.alsoKnownAs).toUnmodifiableList();

  /// Provides a list of all the default (names in snake_case) shortcodes for the emojis.
  List<String> get shortcodes => map((e) => e.shortcode).toUnmodifiableList();

  /// Provides a list of all the CLDR shortcodes for the emojis
  List<String> get cldrShortcodes {
    return map((e) => e.shortcodes.cldr).whereNotNull().toUnmodifiableList();
  }

  /// Provides a list of all the Discord-specific shortcodes for the emojis
  List<String> get discordShortcodes {
    return map((e) => e.shortcodes.discord).whereNotNull().toUnmodifiableList();
  }

  /// Provides a list of all the GitHub-specific shortcodes for the emojis
  List<String> get githubShortcodes {
    return map((e) => e.shortcodes.github).whereNotNull().toUnmodifiableList();
  }

  /// Provides a list of all the Slack-specific shortcodes for the emojis
  List<String> get slackShortcodes {
    return map((e) => e.shortcodes.slack).whereNotNull().toUnmodifiableList();
  }

  /// Provides a list of all the groups to which the emojis belong
  List<Group> get groups => map((e) => e.group).toUnmodifiableList();

  /// Provides a list of all the subgroups to which the emojis belong
  List<Subgroup> get subgroups => map((e) => e.subgroup).toUnmodifiableList();

  /// Provides a list of all the versions in which each emoji was introduced
  List<Version> get versions => map((e) => e.version).toUnmodifiableList();

  /// Provides a list of all the statuses of the emojis.
  List<Status> get statuses => map((e) => e.status).toUnmodifiableList();
}
