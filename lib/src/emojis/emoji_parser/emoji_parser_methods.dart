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
  int countWhere(bool Function(Emoji emoji) count) => get.where(count).length;

  /// Counts the number of emojis in the String value that satisfy the given [count] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.countWhereIndexed((i, e) => i == 1 && e.value == '❤️'); // 1
  /// '🟡text❤️text🟦text🟢'.emojis.countWhereIndexed((i, e) => i == 0 && e.name.contains('Circle')); // 1
  /// ```
  int countWhereIndexed(bool Function(int index, Emoji emoji) count) {
    return get.whereIndexed(count).length;
  }

  /// Removes the emoji at the specified [position] in the String value.
  /// If the [position] is out of range or there is no emoji at that position,
  /// the original String is returned.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeAt(1); // 🟡texttext🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.removeAt(10); // 🟡text❤️text🟦text🟢
  /// ```
  String removeAt(int position) {
    String output = _value;
    final emoji = extract.firstWhereIndexedOrNull((i, e) => i == position);
    return emoji == null ? output : output.replaceFirst(emoji, '');
  }

  /// Removes the emoji from the end of the String value at the specified [position].
  /// If the [position] is out of range or there is no emoji at that position from the end,
  /// the original String is returned.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeFromEnd(1); // 🟡text❤️texttext🟢
  /// '🟡text❤️text🟦text🟢'.emojis.removeFromEnd(10); // 🟡text❤️text🟦text🟢
  /// ```
  String removeFromEnd(int position) {
    String output = _value;
    final emojis = extract;
    final emoji = emojis
        .firstWhereIndexedOrNull((i, e) => i == emojis.length - 1 - position);
    return emoji == null ? output : output.replaceFirst(emoji, '');
  }

  /// Removes every occurrence of emojis specified in the [emojis] list from the String value.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeEveryOf(['❤️', '🟦']); // 🟡texttexttext🟢
  /// ```
  String removeEveryOf(List<String> emojis) {
    String output = _value;
    extract.distinct().forEach((emoji) {
      if (emojis.contains(emoji)) {
        output = output.replaceAll(emoji, '');
      }
    });
    return output;
  }

  /// Removes emojis from the String where the provided [remove] function returns true.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhere((e) => e.value == '❤️'); // 🟡texttext🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhere((e) => e.name.contains('Circle')); // text❤️text🟦text
  /// ```
  String removeWhere(bool Function(Emoji emoji) remove) {
    String output = _value;
    get.distinct().forEach((emoji) {
      if (remove(emoji)) {
        output = output.replaceAll(emoji.value, '');
      }
    });
    return output;
  }

  /// Removes emojis from the String where the provided [remove] function returns true.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhereIndexed((i, e) => i == 1 && e.value == '❤️'); // 🟡texttext🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.removeWhereIndexed((i, e) => i == 0 && e.name.contains('Circle')); // text❤️text🟦text🟢
  /// ```
  String removeWhereIndexed(bool Function(int index, Emoji emoji) remove) {
    String output = _value;
    get.forEachIndexed((index, emoji) {
      if (remove(index, emoji)) {
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
  List<String> splitWhere(bool Function(Emoji emoji) split) {
    final valuesToSplit =
        get.distinct().where(split).toUnmodifiableList().values;
    return valuesToSplit.isNotEmpty
        ? _value.split(RegExp(valuesToSplit.join('|')))
        : [_value];
  }

  /// Splits the String into a list of substrings based on the provided [split]
  /// function that determines where to split the String. The [split] function
  /// takes an index and an Emoji character as input.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.splitWhereIndexed((i, e) => i == 1 && e.value == '❤️'); // [🟡text, text🟦text🟢]
  /// ```
  List<String> splitWhereIndexed(bool Function(int index, Emoji emoji) split) {
    final valuesToSplit = get.whereIndexed(split).toUnmodifiableList().values;
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
  String replaceWhere(String? Function(Emoji emoji) replace) {
    String output = _value;
    get.distinct().forEach((emoji) {
      final replacement = replace(emoji);
      if (replacement != null) {
        output = output.replaceAll(emoji.value, replacement);
      }
    });
    return output;
  }

  /// Returns a new String where each emoji character is replaced by the result of
  /// applying the specified function [replace].
  /// The [replace] function takes an emoji character and its index as input and returns the String
  /// to replace it with. If the [replace] function returns `null`, the original emoji character
  /// is retained.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.replaceWhereIndexed((i, e) => i == 1 ? '123' : null); // 🟡text123text🟦text🟢
  /// '🟡text❤️text🟦text🟢'.emojis.replaceWhereIndexed((i, e) => i == 0 && e.name.contains('Circle') ? '123' : null); // 123text❤️text🟦text🟢
  /// ```
  String replaceWhereIndexed(String? Function(int index, Emoji emoji) replace) {
    String output = _value;
    get.forEachIndexed((index, emoji) {
      final replacement = replace(index, emoji);
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
      return Emojis.getOneOrNull(match)?.shortcodes.wherePlatform(platform) ??
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
      return Emojis.getOneOrNull(match.removeColons())?.value ??
          onUnknownShortcode?.call(match) ??
          match;
    });
  }

  /// Executes the provided [action] for each emoji in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.forEach((e) => print(e.value)); // 🟡 ❤️ 🟦 🟢
  /// ```
  void forEach(void Function(Emoji emoji) action) => get.forEach(action);

  /// Executes the provided [action] for each emoji in the parsed String while the condition is true.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.forEachWhile((e) {
  ///                                                 print(e.value);
  ///                                                 return e.value == '🟡';
  ///                                                }); // 🟡 ❤️
  /// ```
  void forEachWhile(bool Function(Emoji emoji) action) {
    get.forEachWhile(action);
  }

  /// Executes the provided [action] for each emoji in the parsed String along with its index.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.forEachIndexed(i,e) => print('$i:${e.value}')); // 0:🟡 1:❤️ 2:🟦 3:🟢
  /// ```
  void forEachIndexed(void Function(int index, Emoji emoji) action) {
    get.forEachIndexed(action);
  }

  /// Executes the provided [action] for each emoji in the parsed String along with its index
  /// while the condition is true.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.forEachIndexedWhile((i, e) {
  ///                                                           print('$i:${e.value}');
  ///                                                           return e.value == '🟡';
  ///                                                          }); // 0:🟡 1:❤️
  /// ```
  void forEachIndexedWhile(bool Function(int index, Emoji emoji) action) {
    get.forEachIndexedWhile(action);
  }

  /// Maps each emoji in the parsed String to another emoji based on the provided [toElement] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.map((e) => e.value); // [🟡, ❤️, 🟦, 🟢]
  /// ```
  List<T> map<T>(T Function(Emoji emoji) toElement) {
    return get.map(toElement).toUnmodifiableList();
  }

  /// Maps each emoji in the parsed String to another emoji along with its index
  /// based on the provided [convert] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.mapIndexed((i, e) => '$i: ${e.name}'); // [0: Yellow Circle, 1: Red Heart, 2: Blue Square, 3: Green Circle]
  /// ```
  List<T> mapIndexed<T>(T Function(int index, Emoji emoji) convert) {
    return get.mapIndexed(convert).toUnmodifiableList();
  }

  /// Filters the emojis in the parsed String based on the provided [test] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.where((e) => e.name.contains('Circle')); // [Emoji(value: 🟡, ...), Emoji(value: 🟢, ...)]
  /// ```
  List<Emoji> where(bool Function(Emoji emoji) test) {
    return get.where(test).toUnmodifiableList();
  }

  /// Filters the emojis in the parsed String along with their index
  /// based on the provided [test] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.whereIndexed((i, e) => i == 0 && e.name.contains('Circle')); // [Emoji(value: 🟡, ...)]
  /// ```
  List<Emoji> whereIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereIndexed(test).toUnmodifiableList();
  }

  /// Filters out emojis in the parsed String based on the provided [test] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.whereNot((e) => e.name.contains('Circle')); // [Emoji(value: ❤️, ...), Emoji(value: 🟦, ...)]
  /// ```
  List<Emoji> whereNot(bool Function(Emoji emoji) test) {
    return get.whereNot(test).toUnmodifiableList();
  }

  /// Filters out emojis in the parsed String along with their index
  /// based on the provided [test] function.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.whereNotIndexed((i, e) => i == 0 && e.name.contains('Circle')); [Emoji(value: ❤️, ...), Emoji(value: 🟦, ...), Emoji(value: 🟢, ...)]
  /// ```
  List<Emoji> whereNotIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereNotIndexed(test).toUnmodifiableList();
  }

  /// Combines the emojis in the parsed String into a single value
  /// using the provided [combine] function and an initial [initialValue].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.fold('text', (p, c) => p + c.value); // text🟡❤️🟦🟢
  /// ```
  T fold<T>(T initialValue, T Function(T previousValue, Emoji emoji) combine) {
    return get.fold(initialValue, combine);
  }

  /// Combines the emojis in the parsed String along with their index
  /// into a single value using the provided [combine] function and an initial [initialValue].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.foldIndexed('text', (i, p ,c) => '$p${c.value}$i'); // text🟡0❤️1🟦2🟢3
  /// ```
  T foldIndexed<T>(
    T initialValue,
    T Function(int index, T previousValue, Emoji emoji) combine,
  ) {
    return get.foldIndexed(initialValue, combine);
  }

  /// Finds the first emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhere((e) => e.name.contains('Circle')); // Emoji(value: 🟡, ...)
  /// ```
  Emoji firstWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhere(test, orElse: orElse);
  }

  /// Finds the first emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhereIndexed((i, e) => i > 0 && e.name.contains('Circle')); // Emoji(value: 🟢, ...)
  /// ```
  Emoji firstWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhereIndexed(test, orElse: orElse);
  }

  /// Finds the first emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhereOrNull((e) => e.name.contains('Circle')); // Emoji(value: 🟡, ...)
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhereOrNull((e) => e.value == '🔶'); // null
  /// ```
  Emoji? firstWhereOrNull(bool Function(Emoji emoji) test) {
    return get.firstWhereOrNull(test);
  }

  /// Finds the first emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.name.contains('Circle')); // Emoji(value: 🟡, ...)
  /// '🟡text❤️text🟦text🟢'.emojis.firstWhereIndexedOrNull((i, e) => i == 0 && e.value == '❤️'); // null
  /// ```
  Emoji? firstWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.firstWhereIndexedOrNull(test);
  }

  /// Finds the last emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhere((e) => e.name.contains('Circle')); // Emoji(value: 🟢, ...)
  /// ```
  Emoji lastWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhere(test, orElse: orElse);
  }

  /// Finds the last emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns [orElse] result if provided, otherwise throws a [StateError].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhereIndexed((i, e) => i < 1 && e.name.contains('Circle')); // Emoji(value: 🟡, ...)
  /// ```
  Emoji lastWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhereIndexed(test, orElse: orElse);
  }

  /// Finds the last emoji in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhereOrNull((e) => e.name.contains('Circle')); // Emoji(value: 🟢, ...)
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhereOrNull((e) => e.value == '🔶'); // null
  /// ```
  Emoji? lastWhereOrNull(bool Function(Emoji emoji) test) {
    return get.lastWhereOrNull(test);
  }

  /// Finds the last emoji along with its index in the parsed String that satisfies the provided [test] function.
  /// If no such emoji is found, returns `null`.
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhereOrNull((e) => i == 3 && e.name.contains('Circle')); // Emoji(value: 🟢, ...)
  /// '🟡text❤️text🟦text🟢'.emojis.lastWhereIndexedOrNull((i, e) => i == 0 && e.value == '❤️'); // null
  /// ```
  Emoji? lastWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.lastWhereIndexedOrNull(test);
  }

  /// Returns an unmodifiable list of the first [count] emojis from the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.take(2); // [Emoji(value: 🟡, ...), Emoji(value: ❤️, ...)]
  /// ```
  List<Emoji> take(int count) => get.take(count).toUnmodifiableList();

  /// Returns an unmodifiable list of the last [count] emojis from the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.takeLast(2); // [Emoji(value: 🟦, ...), Emoji(value: 🟢, ...)]
  /// ```
  List<Emoji> takeLast(int count) => get.takeLast(count).toUnmodifiableList();

  /// Returns an unmodifiable list of emojis from the parsed String as long as the provided [test] function returns `true`.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.takeWhile((e) => e.value == '🟡'); [Emoji(value: 🟡, ...)]
  /// ```
  List<Emoji> takeWhile(bool Function(Emoji emoji) test) {
    return get.takeWhile(test).toUnmodifiableList();
  }

  /// Skips the first [count] emojis from the parsed String and returns the rest as an unmodifiable list.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.skip(2); // [Emoji(value: 🟦, ...), Emoji(value: 🟢️, ...)]
  /// ```
  List<Emoji> skip(int count) => get.skip(count).toUnmodifiableList();

  /// Skips the last [count] emojis from the parsed String and returns the rest as an unmodifiable list.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.skipLast(2); // [Emoji(value: 🟡, ...), Emoji(value: ❤️, ...)]
  /// ```
  List<Emoji> skipLast(int count) => get.skipLast(count).toUnmodifiableList();

  /// Skips emojis from the parsed String as long as the provided [test] function returns `true`
  /// and returns the rest as an unmodifiable list.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.skipWhile((e) => e.value == '🟡'); // [Emoji(value: ❤️, ...), Emoji(value: 🟦, ...), Emoji(value: 🟢️, ...)]
  /// ```
  List<Emoji> skipWhile(bool Function(Emoji emoji) test) {
    return get.skipWhile(test).toUnmodifiableList();
  }

  /// Joins emojis in the parsed string into a single String using a provided transformation function.
  ///
  /// The [transform] function is applied to each emoji, and the results are concatenated
  /// with the [separator] between them. Additionally, the [prefix] is added at the beginning
  /// of the resulting String, and the [suffix] is added at the end.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.join((e) => e.value, separator: '.', prefix: 'prefix', suffix: 'suffix'); // 'prefix🟡.❤️.🟦.🟢suffix'
  /// ```
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
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.any((e) => e.value == '🟢'); // true
  /// '🟡text❤️text🟦text🟢'.emojis.any((e) => e.value == '🔶'); // false
  /// ```
  bool any(bool Function(Emoji emoji) test) => get.any(test);

  /// Determines if the String value contains any of the given emojis.
  /// Same as [someOf]
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.anyOf(['🟡', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.anyOf(['🔶', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.anyOf(['🔶']); // false
  /// ```
  bool anyOf(List<String> emojis) => emojis.any(_value.contains);

  /// Checks if at least one emoji in the parsed String satisfies the given [test].
  /// Same as [any]
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.some((e) => e.value == '🟢'); // true
  /// '🟡text❤️text🟦text🟢'.emojis.some((e) => e.value == '🔶'); // false
  /// ```
  bool some(bool Function(Emoji emoji) test) => get.any(test);

  /// Determines if the String value contains any of the given emojis.
  /// Same as [anyOf]
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.someOf(['🟡', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.someOf(['🔶', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.someOf(['🔶']); // false
  /// ```
  bool someOf(List<String> emojis) => emojis.any(_value.contains);

  /// Checks if none of the emojis in the parsed String satisfy the given [test].
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.none((e) => e.value == '🔶'); // true
  /// '🟡text❤️text🟦text🟢'.emojis.none((e) => e.value == '🟢'); // false
  /// ```
  bool none(bool Function(Emoji emoji) test) => get.none(test);

  /// Checks if none of the provided [emojis] are present in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.noneOf(['🔶']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.noneOf(['🔶', '🟢']); // false
  /// '🟡text❤️text🟦text🟢'.emojis.noneOf(['🟡', '🟢']); // false
  /// ```
  bool noneOf(List<String> emojis) => emojis.none(_value.contains);

  /// Checks if all emojis in the parsed String satisfy the given [test].
  ///
  /// Example:
  /// ```dart
  /// '🟡text🟦text🟢'.emojis.every((e) => e.group == Group.symbols); // true
  /// '🟡text🟦text🟢'.emojis.every((e) => e.value == '🟡'); // false
  /// ```
  bool every(bool Function(Emoji emoji) test) => get.every(test);

  /// Determines if the String value contains all of the given emojis.
  /// Same as [containsOf]
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.everyOf(['🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.everyOf(['🟡', '❤️', '🟦', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.everyOf(['🔶']); // false
  /// ```
  bool everyOf(List<String> emojis) => emojis.every(_value.contains);

  /// Determines if the String value contains all of the given emojis.
  /// Same as [everyOf]
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.containsOf(['🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsOf(['🟡', '❤️', '🟦', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsOf(['🔶']); // false
  /// ```
  bool containsOf(List<String> emojis) => emojis.every(_value.contains);

  /// Checks if the parsed String contains only emojis from the provided [emojis] list.
  ///
  /// Returns `true` if every emoji in the parsed String is present in the [emojis] list,
  /// and there are no additional emojis present in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOf(['🟢']); // false
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOf(['🟡', '❤️', '🟦', '🟢']); // true
  /// '🟡text❤️text🟦text🟢text❤️'.emojis.containsExactlyOf(['🟡', '❤️', '🟦', '🟢']); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOf(['🔶']); // false
  /// ```
  bool containsExactlyOf(List<String> emojis) {
    return emojis.every((e) => extract.contains(e)) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }

  /// Checks if the parsed String contains only one emoji that satisfies the given [test].
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that satisfies
  /// the provided [test], and there are no additional emojis in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.containsOne((e) => e.value == '❤️'); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsOne((e) => e.value == '🔶'); // false
  /// '🟡text❤️text🟦text🟢'.emojis.containsOne((e) => e.name.contains('Circle')); // false
  /// ```
  bool containsOne(bool Function(Emoji emoji) test) {
    return where(test).length == 1;
  }

  /// Checks if the parsed String contains only one emoji that satisfies the given [test].
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that satisfies
  /// the provided [test], and there are no additional emojis in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text'.emojis.containsExactlyOne((e) => e.value == '🟡'); // true
  /// '🟡text❤️'.emojis.containsExactlyOne((e) => e.value == '🟡'); // false
  /// 'text'.emojis.containsExactlyOne((e) => e.value == '🟡'); // false
  /// ```
  bool containsExactlyOne(bool Function(Emoji emoji) test) {
    return where(test).length == 1 && whereNot(test).isEmpty;
  }

  /// Checks if the parsed String contains only one emoji that is present in the provided [emojis] set.
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that is present
  /// in the [emojis] set, and `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.containsOneOf({'🟡', '❤️', '🟦', '🟢'}); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsOneOf({'🟡', '❤️', '🟦'}); // true
  /// '🟡text❤️text🟦text🟢'.emojis.containsOneOf({'🟡', '❤️', '🔶'}); // false
  /// '🟡text❤️text🟦text🟢text❤️'.emojis.containsOneOf({'❤️'}); // false
  /// ```
  bool containsOneOf(Set<String> emojis) {
    return emojis
        .every((e) => extract.where((value) => value == e).length == 1);
  }

  /// Checks if the parsed String contains only one emoji that is present in the provided [emojis] set.
  ///
  /// Returns `true` if there is exactly one emoji in the parsed String that is present
  /// in the [emojis] set, and there are no additional emojis in the parsed String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOneOf({'🟡', '❤️', '🟦', '🟢'}); // true
  /// '🟡text❤️text🟦text🟢text❤️'.emojis.containsExactlyOneOf({'🟡', '❤️', '🟦', '🟢'}); // false
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOneOf({'🟡', '❤️', '🟦'}); // false
  /// '🟡text❤️text🟦text🟢'.emojis.containsExactlyOneOf({'🟡', '❤️', '🔶'}); // false
  /// ```
  bool containsExactlyOneOf(Set<String> emojis) {
    return emojis
            .every((e) => extract.where((value) => value == e).length == 1) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }
}
