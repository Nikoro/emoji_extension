part of '../emojis.dart';

/// Extension providing various utility getters for Emoji class.
extension EmojiGetters on Emoji {
  /// Returns the default shortcode of the emoji as a String.
  String get shortcode => shortcodes.wherePlatform(Platform.Default).first;

  /// Returns the CLDR shortcode of the emoji as a String.
  String get cldrShortcode => cldrShortcodes.first;

  /// Returns the Discord shortcode of the emoji as a String
  /// or null if there isn't one.
  String? get discordShortcode => discordShortcodes.firstOrNull;

  /// Returns the Discord shortcode of the emoji as a String
  /// or null if there isn't one.
  String? get slackShortcode => slackShortcodes.firstOrNull;

  /// Returns the GitHub shortcode of the emoji as a String
  /// or null if there isn't one.
  String? get githubShortcode => githubShortcodes.firstOrNull;

  /// Returns the CLDR shortcodes of the emoji as a List of Strings.
  List<String> get cldrShortcodes => shortcodes.cldr;

  /// Returns the Discord shortcodes of the emoji as a List of Strings.
  List<String> get discordShortcodes => shortcodes.discord;

  /// Returns the GitHub shortcodes of the emoji as a List of Strings.
  List<String> get githubShortcodes => shortcodes.github;

  /// Returns the Slack shortcodes of the emoji as a List of Strings.
  List<String> get slackShortcodes => shortcodes.slack;

  bool get isFullyQualified => status == Status.fullyQualified;

  bool get isMinimallyQualified => status == Status.minimallyQualified;

  bool get isUnqualified => status == Status.unqualified;

  bool get isComponent => status == Status.component;

  bool get isV6_0 => version == Version.v6_0;

  bool get isV7_0 => version == Version.v7_0;

  bool get isV8_0 => version == Version.v8_0;

  bool get isV9_0 => version == Version.v9_0;

  bool get isV10_0 => version == Version.v10_0;

  bool get isV11_0 => version == Version.v11_0;

  bool get isV12_0 => version == Version.v12_0;

  bool get isV12_1 => version == Version.v12_1;

  bool get isV13_0 => version == Version.v13_0;

  bool get isV13_1 => version == Version.v13_1;

  bool get isV14_0 => version == Version.v14_0;

  bool get isV15_0 => version == Version.v15_0;

  bool get isV15_1 => version == Version.v15_1;

  bool get isFlag => group == Group.flags;

  bool get isFruit => subgroup == Subgroup.foodFruit;

  bool get isVegetable => subgroup == Subgroup.foodVegetable;

  bool get isAnimal => Subgroup.values
      .where((s) => s.value.contains('animal'))
      .any((s) => s == subgroup);

  bool get isFlower => subgroup == Subgroup.plantFlower;

  bool get isSymbol => group == Group.symbols;

  bool get isGeometric => subgroup == Subgroup.geometric;

  bool get isPerson => Subgroup.values
      .where((s) => s.value.contains('person'))
      .any((s) => s == subgroup);

  bool get isMan {
    final regex = Regex.man;
    return !isMultiPerson &&
        (regex.hasMatch(name) ||
            (appleName != null && regex.hasMatch(appleName!) ||
                alsoKnownAs.any((a) => regex.hasMatch(a))));
  }

  bool get isWoman {
    final regex = Regex.woman;
    return !isMultiPerson &&
        (regex.hasMatch(name) ||
            (appleName != null && regex.hasMatch(appleName!) ||
                alsoKnownAs.any((a) => regex.hasMatch(a))));
  }

  bool get isMultiPerson {
    return subgroup == Subgroup.family || name.containsIgnoreCase('family');
  }

  bool get hasSkinTone => Regex.skinTone.hasMatch(unicode);

  bool get hasHairStyle => Regex.hairStyle.hasMatch(unicode);

  bool get hasFace {
    final regex = Regex.face;
    return Subgroup.values
            .where((s) => s.value.contains('face'))
            .any((s) => s == subgroup) ||
        regex.hasMatch(name) ||
        (appleName != null && regex.hasMatch(appleName!) ||
            alsoKnownAs.any((a) => regex.hasMatch(a)));
  }

  bool get hasColor {
    final regex = Regex.color;
    return (regex.hasMatch(name) ||
        (appleName != null && regex.hasMatch(appleName!) ||
            alsoKnownAs.any((a) => regex.hasMatch(a))));
  }
}
