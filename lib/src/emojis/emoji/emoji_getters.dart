part of '../emojis.dart';

/// Extension providing various utility getters for Emoji class.
extension EmojiGetters on Emoji {
  /// Returns the default shortcode of the emoji as a String.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').shortcode; // :red_heart:
  /// Emoji('🟡').shortcode; // :yellow_circle:
  /// ```
  String get shortcode => shortcodes.wherePlatform(Platform.Default).first;

  /// Returns the CLDR shortcode of the emoji as a String.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').cldrShortcode; // :red_heart:
  /// Emoji('🟡').cldrShortcode; // :yellow_circle:
  /// ```
  String get cldrShortcode => shortcodes.cldr.first;

  /// Returns the Discord shortcode of the emoji as a String
  /// or null if there isn't one.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').discordShortcode; // :heart:
  /// Emoji('🟡').discordShortcode; // :yellow_circle:
  /// Emoji('🫨').discordShortcode; // null
  /// ```
  String? get discordShortcode => discordShortcodes.firstOrNull;

  /// Returns the GitHub shortcode of the emoji as a String
  /// or null if there isn't one.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').githubShortcode; // :heart:
  /// Emoji('🟡').githubShortcode; // :yellow_circle:
  /// Emoji('🫨').githubShortcode; // null
  /// ```
  String? get githubShortcode => githubShortcodes.firstOrNull;

  /// Returns the Discord shortcode of the emoji as a String
  /// or null if there isn't one.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').slackShortcode; // :heart:
  /// Emoji('🟡').slackShortcode; // :large_yellow_circle:
  /// Emoji('🫨').slackShortcode; // null
  /// ```
  String? get slackShortcode => slackShortcodes.firstOrNull;

  /// Returns the Discord shortcodes of the emoji as a List of Strings.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').discordShortcodes; // [:heart:]
  /// Emoji('😆').discordShortcodes; // [:laughing:, :satisfied:]
  /// Emoji('🫨').discordShortcodes; // []
  /// ```
  List<String> get discordShortcodes => shortcodes.discord;

  /// Returns the GitHub shortcodes of the emoji as a List of Strings.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').githubShortcodes; // [:heart:]
  /// Emoji('😆').githubShortcodes; // [:laughing:, :satisfied:]
  /// Emoji('🫨').githubShortcodes; // []
  /// ```
  List<String> get githubShortcodes => shortcodes.github;

  /// Returns the Slack shortcodes of the emoji as a List of Strings.
  ///
  /// Example:
  /// ```dart
  /// Emoji('❤️').slackShortcodes; // [:heart:]
  /// Emoji('😆').slackShortcodes; // [:laughing:, :satisfied:]
  /// Emoji('🫨').slackShortcodes; // []
  /// ```
  List<String> get slackShortcodes => shortcodes.slack;

  /// Returns `true` if the emoji is fully qualified.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😀').isFullyQualified; // true
  /// Emoji('😶‍🌫').isFullyQualified; // false
  /// ```
  bool get isFullyQualified => status == Status.fullyQualified;

  /// Returns `true` if the emoji is minimally qualified.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😶‍🌫').isMinimallyQualified; // true
  /// Emoji('😀').isMinimallyQualified; // false
  /// ```
  bool get isMinimallyQualified => status == Status.minimallyQualified;

  /// Returns `true` if the emoji is unqualified.
  ///
  /// Example:
  /// ```dart
  /// Emoji('☹').isUnqualified; // true
  /// Emoji('😀').isUnqualified; // false
  /// ```
  bool get isUnqualified => status == Status.unqualified;

  /// Returns `true` if the emoji is a component.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🏻').isComponent; // true
  /// Emoji('😀').isComponent; // false
  /// ```
  bool get isComponent => status == Status.component;

  /// Returns `true` if the emoji's version is v6.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😀').isV6_0; // true
  /// Emoji('😐').isV6_0; // false
  /// ```
  bool get isV6_0 => version == Version.v6_0;

  /// Returns `true` if the emoji's version is v7.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😐').isV7_0; // true
  /// Emoji('😀').isV7_0; // false
  /// ```
  bool get isV7_0 => version == Version.v7_0;

  /// Returns `true` if the emoji's version is v8.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😑').isV8_0; // true
  /// Emoji('😀').isV8_0; // false
  /// ```
  bool get isV8_0 => version == Version.v8_0;

  /// Returns `true` if the emoji's version is v9.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🤥').isV9_0; // true
  /// Emoji('😀').isV9_0; // false
  /// ```
  bool get isV9_0 => version == Version.v9_0;

  /// Returns `true` if the emoji's version is v10.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🤮').isV10_0; // true
  /// Emoji('😀').isV10_0; // false
  /// ```
  bool get isV10_0 => version == Version.v10_0;

  /// Returns `true` if the emoji's version is v11.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🥵').isV11_0; // true
  /// Emoji('😀').isV11_0; // false
  /// ```
  bool get isV11_0 => version == Version.v11_0;

  /// Returns `true` if the emoji's version is v12.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🥱').isV12_0; // true
  /// Emoji('😀').isV12_0; // false
  /// ```
  bool get isV12_0 => version == Version.v12_0;

  /// Returns `true` if the emoji's version is v12.1.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🧑‍🦰').isV12_1; // true
  /// Emoji('😀').isV12_1; // false
  /// ```
  bool get isV12_1 => version == Version.v12_1;

  /// Returns `true` if the emoji's version is v13.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🥷').isV13_0; // true
  /// Emoji('😀').isV13_0; // false
  /// ```
  bool get isV13_0 => version == Version.v13_0;

  /// Returns `true` if the emoji's version is v13.1.
  ///
  /// Example:
  /// ```dart
  /// Emoji('💏🏻').isV13_1; // true
  /// Emoji('😀').isV13_1; // false
  /// ```
  bool get isV13_1 => version == Version.v13_1;

  /// Returns `true` if the emoji's version is v14.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🪸').isV14_0; // true
  /// Emoji('😀').isV14_0; // false
  /// ```
  bool get isV14_0 => version == Version.v14_0;

  /// Returns `true` if the emoji's version is v15.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🪼').isV15_0; // true
  /// Emoji('😀').isV15_0; // false
  /// ```
  bool get isV15_0 => version == Version.v15_0;

  /// Returns `true` if the emoji's version is v15.1.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🍋‍🟩').isV15_1; // true
  /// Emoji('😀').isV15_1; // false
  /// ```
  bool get isV15_1 => version == Version.v15_1;

  /// Returns `true` if the emoji's version is v16.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🫩').isV16_0; // true
  /// Emoji('😀').isV16_0; // false
  /// ```
  bool get isV16_0 => version == Version.v16_0;

  /// Returns `true` if the emoji belongs to Unicode version 17.0.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🫪').isV17_0; // true
  /// Emoji('😀').isV17_0; // false
  /// ```
  bool get isV17_0 => version == Version.v17_0;

  /// Returns `true` if the emoji belongs to the flags group.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🏁').isFlag; // true
  /// Emoji('😀').isFlag; // false
  /// ```
  bool get isFlag => group == Group.flags;

  /// Returns `true` if the emoji belongs to the food sub-group fruit.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🍇').isFruit; // true
  /// Emoji('😀').isFruit; // false
  /// ```
  bool get isFruit => subgroup == Subgroup.foodFruit;

  /// Returns `true` if the emoji belongs to the food sub-group vegetable.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🍆').isVegetable; // true
  /// Emoji('😀').isVegetable; // false
  /// ```
  bool get isVegetable => subgroup == Subgroup.foodVegetable;

  /// Returns `true` if the emoji belongs to the animal subgroup.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🐵').isAnimal; // true
  /// Emoji('😀').isAnimal; // false
  /// ```
  bool get isAnimal => Subgroup.values
      .where((s) => s.value.contains('animal'))
      .any((s) => s == subgroup);

  /// Returns `true` if the emoji belongs to the plant sub-group flower.
  ///
  /// Example:
  /// ```dart
  /// Emoji('💐').isFlower; // true
  /// Emoji('😀').isFlower; // false
  /// ```
  bool get isFlower => subgroup == Subgroup.plantFlower;

  /// Returns `true` if the emoji belongs to the symbols group.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🏧').isSymbol; // true
  /// Emoji('😀').isSymbol; // false
  /// ```
  bool get isSymbol => group == Group.symbols;

  /// Returns `true` if the emoji belongs to the geometric subgroup.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🔴').isGeometric; // true
  /// Emoji('😀').isGeometric; // false
  /// ```
  bool get isGeometric => subgroup == Subgroup.geometric;

  /// Returns `true` if the emoji belongs to the person subgroup.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🙍').isPerson; // true
  /// Emoji('🔴').isPerson; // false
  /// ```
  bool get isPerson => Subgroup.values
      .where((s) => s.value.contains('person'))
      .any((s) => s == subgroup);

  /// Returns `true` if the emoji represents a man.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👨').isMan; // true
  /// Emoji('👩').isMan; // false
  /// Emoji('🔴').isMan; // false
  /// ```
  bool get isMan {
    final regex = Regex.man;
    return !isMultiPerson &&
        (regex.hasMatch(name) ||
            (appleName != null && regex.hasMatch(appleName!) ||
                alsoKnownAs.any((a) => regex.hasMatch(a))));
  }

  /// Returns `true` if the emoji represents a woman.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👩').isWoman; // true
  /// Emoji('👨').isWoman; // false
  /// Emoji('🔴').isWoman; // false
  /// ```
  bool get isWoman {
    final regex = Regex.woman;
    return !isMultiPerson &&
        (regex.hasMatch(name) ||
            (appleName != null && regex.hasMatch(appleName!) ||
                alsoKnownAs.any((a) => regex.hasMatch(a))));
  }

  /// Returns `true` if the emoji represents multiple persons.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👪').isMultiPerson; // true
  /// Emoji('👨').isMultiPerson; // false
  /// Emoji('🔴').isMultiPerson; // false
  /// ```
  bool get isMultiPerson {
    return subgroup == Subgroup.family || name.containsIgnoreCase('family');
  }

  /// Returns `true` if the emoji has a skin tone modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👩🏻').hasSkinTone; // true
  /// Emoji('👩').hasSkinTone; // false
  /// Emoji('🔴').hasSkinTone; // false
  /// ```
  bool get hasSkinTone => Regex.skinTone.hasMatch(unicode);

  /// Returns the skin tone modifier of the emoji, if present.
  ///
  /// Returns `null` if the emoji does not have a skin tone modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👩🏻').skinTone; // SkinTone.light
  /// Emoji('👩🏿').skinTone; // SkinTone.dark
  /// Emoji('👩').skinTone; // null
  /// Emoji('🔴').skinTone; // null
  /// ```
  SkinTone? get skinTone {
    final regex = Regex.skinTone;
    final value = regex.firstMatch(unicode)?.group(0);
    return value != null ? SkinTone.from(value) : null;
  }

  /// Returns `true` if the emoji has a hair style modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👱‍♂️').hasHairStyle; // true
  /// Emoji('👨‍🦰').hasHairStyle; // true
  /// Emoji('👨').hasHairStyle; // false
  /// Emoji('🔴').hasHairStyle; // false
  /// ```
  bool get hasHairStyle => Regex.hairStyle.hasMatch(unicode);

  /// Returns the hairstyle modifier of the emoji, if present.
  ///
  /// Returns `null` if the emoji does not have a hairstyle modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('👨‍🦰').hairStyle; // HairStyle.red
  /// Emoji('👨‍🦳').hairStyle; // HairStyle.white
  /// Emoji('👨').hairStyle; // null
  /// Emoji('🔴').hasHairStyle; // null
  /// ```
  HairStyle? get hairStyle {
    final regex = Regex.hairStyle;
    final value = regex.firstMatch(unicode)?.group(0);
    return value != null ? HairStyle.from(value) : null;
  }

  /// Returns `true` if the emoji represents a face.
  ///
  /// Example:
  /// ```dart
  /// Emoji('😀').hasFace; // true
  /// Emoji('🌚').hasFace; // true
  /// Emoji('🔴').hasFace; // false
  /// ```
  bool get hasFace {
    final regex = Regex.face;
    return Subgroup.values
            .where((s) => s.value.contains('face'))
            .any((s) => s == subgroup) ||
        regex.hasMatch(name) ||
        (appleName != null && regex.hasMatch(appleName!) ||
            alsoKnownAs.any((a) => regex.hasMatch(a)));
  }

  /// Returns `true` if the emoji has a color modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🔴').hasColor; // true
  /// Emoji('🩵').hasColor; // true
  /// Emoji('😀').hasColor; // false
  /// ```
  bool get hasColor {
    final regex = Regex.color;
    return (regex.hasMatch(name) ||
        (appleName != null && regex.hasMatch(appleName!) ||
            alsoKnownAs.any((a) => regex.hasMatch(a))));
  }

  /// Returns the color modifier of the emoji, if present.
  ///
  /// Returns `null` if the emoji does not have a color modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🩷').color; // Color.pink
  /// Emoji('🩵').color; // Color.lightBlue
  /// Emoji('😀').color; // null
  /// ```
  Color? get color {
    final regex = Regex.color;
    final value = (regex.firstMatch(name) ??
            regex.firstMatch(appleName ?? '') ??
            regex.firstMatch(alsoKnownAs.join(' ')))
        ?.group(0)
        ?.toLowerCase();
    return value != null ? Color.from(value) : null;
  }

  /// Returns `true` if the emoji has a beard modifier.
  ///
  /// Example:
  /// ```dart
  /// Emoji('🧔').hasBeard; // true
  /// Emoji('🧑').hasBeard; // false
  /// Emoji('😀').hasBeard; // false
  /// ```
  bool get hasBeard => Regex.beard.hasMatch(unicode);
}
