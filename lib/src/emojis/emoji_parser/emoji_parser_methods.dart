part of 'emoji_parser.dart';

/// Extension providing various utility methods for Emoji parsing.
extension EmojiParserMethods on EmojiParser {
  /// Counts the number of emojis in the String value that satisfy the given [count] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.countWhere((e) => e.value == '❤️'); // 1
  /// '🟡text❤️text🟦text🟢'.emojis.countWhere((e) => e.name.contains('Circle')); // 2
  /// ```
  int countWhere(bool Function(Emoji e) count) {
    return get.where(count).length;
  }

  /// Removes emojis from the String where the provided [remove] function returns true.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhere((e) => e.value == '❤️'); // 🟡texttext🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhere((e) => e.name.contains('Circle')); // text❤️text🟦text
  /// ```
  String removeWhere(bool Function(Emoji e) remove) {
    String output = _value;
    get.distinct().forEach((emoji) {
      if (remove(emoji)) {
        output = output.replaceAll(emoji.value, '');
      }
    });
    return output;
  }

  /// Splits the String into a list of substrings based on the provided [split]
  /// function that determines where to split the String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.splitWhere((e) => e.value == '❤️'); // [🟡text, text🟦text🟢]
  /// ```
  List<String> splitWhere(bool Function(Emoji e) split) {
    final valuesToSplit =
        get.distinct().where(split).toUnmodifiableList().values;
    return valuesToSplit.isNotEmpty
        ? _value.split(RegExp(valuesToSplit.join('|')))
        : [_value];
  }

  /// Splits the parsed string at the positions of the emoji characters and maps
  /// each substring either to a replacement String or to itself, according to
  /// the provided [onMatch] and [onNonMatch] functions.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.splitMapJoin(
  /// onMatch: (_) => '_emoji_',
  /// onNonMatch: (s) => s.toUpperCase(),
  /// ); // _emoji_TEXT_emoji_TEXT_emoji_TEXT_emoji_
  /// ```
  String splitMapJoin({
    String Function(Match)? onMatch,
    String Function(String)? onNonMatch,
  }) {
    return _value.splitMapJoin(
      Regex.emoji,
      onMatch: onMatch,
      onNonMatch: onNonMatch,
    );
  }

  /// Returns the parsed String with all emoji characters replaced by the
  /// specified String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.replace('-'); // -text-text-text-
  /// ```
  String replace(String replacement) =>
      _value.replaceAll(Regex.emoji, replacement);

  /// Returns a new String where all occurrences of each emoji character are replaced
  /// with the corresponding replacement String provided in the [emojiToReplacement] map.
  /// If the provided map is empty, returns the original String.
  /// The [emojiToReplacement] map maps each emoji character to its replacement String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.replaceWith({'🟡':'ABC', '❤️':'123'}); // ABCtext123text🟦text🟢
  /// ```
  String replaceWith(Map<String, String> emojiToReplacement) {
    if (emojiToReplacement.isEmpty) return _value;
    String output = _value;
    emojiToReplacement.toMapWhereKeysAreEmojisOnly().forEach((emoji, replace) {
      output = output.replaceAll(emoji, replace);
    });
    return output;
  }

  /// Returns a new String where each emoji character is replaced by the result of
  /// applying the specified function [replace].
  /// The [replace] function takes an emoji character as input and returns the String
  /// to replace it with. If the [replace] function returns `null`, the original emoji character
  /// is retained.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.replaceWhere((e) => e.value == '❤️' ? '123' : null); // 🟡text123text🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.replaceWhere((e) => e.name.contains('Circle') ? '123' : null); // 123text❤️text🟦text123
  /// ```
  String replaceWhere(String? Function(Emoji e) replace) {
    String output = _value;
    get.distinct().forEach((emoji) {
      final replacement = replace(emoji);
      if (replacement != null) {
        output = output.replaceAll(emoji.value, replacement);
      }
    });
    return output;
  }

  /// Converts the [_value] String to shortcodes compatible with CLDR platform.
  /// Returns the resulting String.
  ///
  /// Example:
  /// ```dart
  /// '😀text🤦🏾‍♀️'.emojis.toCLDRShortcodes(); // :grinning_face:text:woman_facepalming_tone4:
  /// ```
  String toCLDRShortcodes() => toShortcodes(Platform.CLDR);

  /// Converts the [_value] String to shortcodes compatible with Discord platform.
  /// Returns the resulting String.
  ///
  /// Example:
  /// ```dart
  /// '😀text🤦🏾‍♀️'.emojis.toDiscordShortcodes(); // :grinning:text:woman_facepalming_tone4:
  /// ```
  String toDiscordShortcodes() => toShortcodes(Platform.Discord);

  /// Converts the [_value] String to shortcodes compatible with Github platform.
  /// Returns the resulting String.
  ///
  /// Note: no skin-tone shortcodes
  ///
  /// Example:
  /// ```dart
  /// '😀text🤦🏾‍♀️'.emojis.toGithubShortcodes(); // :grinning:text🤦🏾‍♀️
  /// ```
  String toGithubShortcodes() => toShortcodes(Platform.Github);

  /// Converts the [_value] String to shortcodes compatible with Slack platform.
  /// Returns the resulting String.
  ///
  /// Example:
  /// ```dart
  /// '😀text🤦🏾‍♀️'.emojis.toSlackShortcodes(); // :grinning:text:woman-facepalming::skin-tone-5:
  /// ```
  String toSlackShortcodes() => toShortcodes(Platform.Slack);

  /// Returns the parsed String with all emoji characters replaced by their
  /// shortcodes as used by the specified [Platform], or by themselves if there
  /// is no known shortcode for the given emoji on that platform.
  ///
  /// Note: Default shortcodes are an emoji name in `snake_case`
  ///
  /// Example:
  /// ```dart
  /// '😀text🤦🏾‍♀️'.emojis.toShortcodes(); // :grinning_face:text:woman_facepalming_medium_dark_skin_tone:
  /// ```
  String toShortcodes([Platform platform = Platform.Default]) {
    return _value.splitMapJoin(Regex.emoji, onMatch: (m) {
      final match = m.group(0)!;
      return Emojis().getOneOrNull(match)?.shortcodes.wherePlatform(platform) ??
          match;
    });
  }

  /// Converts the emojis in [_value] from shortcode format to Unicode characters.
  /// Shortcodes are the text-based representations of emojis used by some platforms.
  /// Returns a new String with the converted emojis.
  ///
  /// Example:
  /// ```dart
  /// Default
  /// ':grinning_face:text:woman_facepalming_medium_dark_skin_tone:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
  /// CLDR
  /// ':grinning_face:text:woman_facepalming_tone4:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
  /// Discord
  /// ':grinning:text:woman_facepalming_tone4:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
  /// Github (no skin-tone shortcodes)
  /// ':grinning:text:woman_facepalming:'.emojis.fromShortcodes(); // 😀text🤦‍♀
  /// Slack
  /// ':grinning:text:woman-facepalming::skin-tone-5:'.emojis.fromShortcodes(); // 😀text🤦🏾‍♀️
  /// ```
  String fromShortcodes(
      {String Function(String unknownShortcode)? onUnknownShortcode}) {
    return _value.splitMapJoin(Regex.shortcode, onMatch: (m) {
      final match = m.group(0)!;
      return Emojis().getOneOrNull(match.removeColons())?.value ??
          onUnknownShortcode?.call(match) ??
          match;
    });
  }

  /// Executes the provided [action] for each emoji in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.replace('-'); // -text-text-text-
  /// ```
  void forEach(void Function(Emoji emoji) action) => get.forEach(action);

  /// Executes the provided [action] for each emoji in the parsed String while the condition is true.
  void forEachWhile(bool Function(Emoji emoji) action) {
    get.forEachWhile(action);
  }

  /// Executes the provided [action] for each emoji in the parsed String along with its index.
  void forEachIndexed(void Function(int index, Emoji emoji) action) {
    get.forEachIndexed(action);
  }

  /// Executes the provided [action] for each emoji in the parsed String along with its index
  /// while the condition is true.
  void forEachIndexedWhile(bool Function(int index, Emoji emoji) action) {
    get.forEachIndexedWhile(action);
  }

  /// Maps each emoji in the parsed String to another emoji based on the provided [toElement] function.
  List<Emoji> map(Emoji Function(Emoji emoji) toElement) {
    return get.map(toElement).toUnmodifiableList();
  }

  /// Maps each emoji in the parsed String to another emoji along with its index
  /// based on the provided [convert] function.
  List<Emoji> mapIndexed(Emoji Function(int index, Emoji emoji) convert) {
    return get.mapIndexed(convert).toUnmodifiableList();
  }

  /// Filters the emojis in the parsed String based on the provided [test] function.
  List<Emoji> where(bool Function(Emoji emoji) test) {
    return get.where(test).toUnmodifiableList();
  }

  /// Filters the emojis in the parsed String along with their index
  /// based on the provided [test] function.
  List<Emoji> whereIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereIndexed(test).toUnmodifiableList();
  }

  /// Filters out emojis in the parsed String based on the provided [test] function.
  List<Emoji> whereNot(bool Function(Emoji emoji) test) {
    return get.whereNot(test).toUnmodifiableList();
  }

  /// Filters out emojis in the parsed String along with their index
  /// based on the provided [test] function.
  List<Emoji> whereNotIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereNotIndexed(test).toUnmodifiableList();
  }

  /// Combines the emojis in the parsed String into a single value
  /// using the provided [combine] function and an initial [initialValue].
  T fold<T>(T initialValue, T Function(T previousValue, Emoji emoji) combine) {
    return get.fold(initialValue, combine);
  }

  /// Combines the emojis in the parsed String along with their index
  /// into a single value using the provided [combine] function and an initial [initialValue].
  T foldIndexed<T>(
    T initialValue,
    T Function(int index, T previousValue, Emoji emoji) combine,
  ) {
    return get.foldIndexed(initialValue, combine);
  }

  /// Finds the first emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  Emoji firstWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhere(test, orElse: orElse);
  }

  /// Finds the first emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  Emoji firstWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhereIndexed(test, orElse: orElse);
  }

  /// Finds the first emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  Emoji? firstWhereOrNull(bool Function(Emoji emoji) test) {
    return get.firstWhereOrNull(test);
  }

  /// Finds the first emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  Emoji? firstWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.firstWhereIndexedOrNull(test);
  }

  /// Finds the last emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  Emoji lastWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhere(test, orElse: orElse);
  }

  /// Finds the last emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  Emoji lastWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhereIndexed(test, orElse: orElse);
  }

  /// Finds the last emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  Emoji? lastWhereOrNull(bool Function(Emoji emoji) test) {
    return get.lastWhereOrNull(test);
  }

  /// Finds the last emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  Emoji? lastWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.lastWhereIndexedOrNull(test);
  }

  /// Returns an unmodifiable list of the first [count] emojis from the parsed String.
  List<Emoji> take(int count) => get.take(count).toUnmodifiableList();

  /// Returns an unmodifiable list of the last [count] emojis from the parsed String.
  List<Emoji> takeLast(int count) => get.takeLast(count).toUnmodifiableList();

  /// Returns an unmodifiable list of emojis from the parsed String as long as the provided [test] function returns `true`.
  List<Emoji> takeWhile(bool Function(Emoji emoji) test) {
    return get.takeWhile(test).toUnmodifiableList();
  }

  /// Skips the first [count] emojis from the parsed String and returns the rest as an unmodifiable list.
  List<Emoji> skip(int count) => get.skip(count).toUnmodifiableList();

  /// Skips emojis from the parsed String as long as the provided [test] function returns `true`
  /// and returns the rest as an unmodifiable list.
  List<Emoji> skipWhile(bool Function(Emoji emoji) test) {
    return get.skipWhile(test).toUnmodifiableList();
  }

  /// Skips the last [count] emojis from the parsed String and returns the rest as an unmodifiable list.
  List<Emoji> skipLast(int count) => get.skipLast(count).toUnmodifiableList();

  /// Joins emojis in the parsed string into a single String using a provided transformation function.
  ///
  /// The [transform] function is applied to each emoji, and the results are concatenated
  /// with the [separator] between them. Additionally, the [prefix] is added at the beginning
  /// of the resulting String, and the [suffix] is added at the end.
  String join(
    String Function(Emoji emoji) transform, {
    String separator = '',
    String prefix = '',
    String suffix = '',
  }) {
    final buffer = StringBuffer();
    int count = 0;

    buffer.write(prefix);
    for (final emoji in get) {
      if (++count > 1) buffer.write(separator);
      buffer.write(transform(emoji));
    }

    buffer.write(suffix);
    return buffer.toString();
  }

  /// Checks if at least one emoji in the parsed String satisfies the given [test].
  /// Same as [some]
  bool any(bool Function(Emoji emoji) test) => get.any(test);

  /// Determines if the String value contains any of the given emojis.
  /// Same as [someOf]
  bool anyOf(List<String> emojis) => emojis.any(_value.contains);

  /// Checks if at least one emoji in the parsed String satisfies the given [test].
  /// Same as [any]
  bool some(bool Function(Emoji emoji) test) => get.any(test);

  /// Determines if the String value contains any of the given emojis.
  /// Same as [anyOf]
  bool someOf(List<String> emojis) => emojis.any(_value.contains);

  /// Checks if none of the emojis in the parsed String satisfy the given [test].
  bool none(bool Function(Emoji emoji) test) => get.none(test);

  /// Checks if none of the provided [emojis] are present in the parsed String.
  bool noneOf(List<String> emojis) => emojis.none(_value.contains);

  /// Checks if all emojis in the parsed String satisfy the given [test].
  bool every(bool Function(Emoji emoji) test) => get.every(test);

  /// Determines if the String value contains all of the given emojis.
  bool everyOf(List<String> emojis) => emojis.every(_value.contains);

  /// Checks if the parsed String contains only emojis that satisfy the given [test].
  ///
  /// Returns `true` if the parsed String is not empty and every emoji in it
  /// satisfies the provided [test], and no emoji fails the test.
  bool containsOnly(bool Function(Emoji emoji) test) {
    return where(test).isNotEmpty && whereNot(test).isEmpty;
  }

  /// Checks if the parsed String contains only emojis from the provided [emojis] list.
  ///
  /// Returns `true` if every emoji in the parsed String is present in the [emojis] list,
  /// and there are no additional emojis present in the parsed String.
  bool containsOnlyOf(List<String> emojis) {
    return emojis.every((e) => extract.contains(e)) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }

  /// Checks if the parsed String contains only one emoji that satisfies the given [test].
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that satisfies
  /// the provided [test], and there are no additional emojis in the parsed String.
  bool containsOnlyOne(bool Function(Emoji emoji) test) {
    return where(test).length == 1 && whereNot(test).isEmpty;
  }

  /// Checks if the parsed String contains only one emoji that is present in the provided [emojis] set.
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that is present
  /// in the [emojis] set, and there are no additional emojis in the parsed String.
  bool containsOnlyOneOf(Set<String> emojis) {
    return emojis
            .every((e) => extract.where((value) => value == e).length == 1) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }
}
