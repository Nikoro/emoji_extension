part of 'emoji_parser.dart';

extension EmojiParserMethods on EmojiParser {
  int countWhere(bool Function(Emoji e) count) {
    return get.where(count).length;
  }

  /// Removes emojis from the String where the provided [remove] function returns true.
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
  /// function that determines where to split the string.
  List<String> splitWhere(bool Function(Emoji e) split) {
    final valuesToSplit =
        get.distinct().where(split).toUnmodifiableList().values;
    return valuesToSplit.isNotEmpty
        ? _value.split(RegExp(valuesToSplit.join('|')))
        : [_value];
  }

  /// Determines if the String value contains any of the given emojis.
  bool anyOf(List<String> emojis) => emojis.any(_value.contains);

  /// Determines if the String value contains all of the given emojis.
  bool everyOf(List<String> emojis) => emojis.every(_value.contains);

  /// Splits the parsed string at the positions of the emoji characters and maps
  /// each substring either to a replacement String or to itself, according to
  /// the provided [onMatch] and [onNonMatch] functions.
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
  String replace(String replacement) =>
      _value.replaceAll(Regex.emoji, replacement);

  /// Returns a new String where all occurrences of each emoji character are replaced
  /// with the corresponding replacement String provided in the [emojiToReplacement] map.
  /// If the provided map is empty, returns the original String.
  /// The [emojiToReplacement] map maps each emoji character to its replacement String.
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
  String toCLDRShortcodes() => toShortcodes(Platform.CLDR);

  /// Converts the [_value] String to shortcodes compatible with Discord platform.
  /// Returns the resulting String.
  String toDiscordShortcodes() => toShortcodes(Platform.Discord);

  /// Converts the [_value] String to shortcodes compatible with Github platform.
  /// Returns the resulting String.
  String toGithubShortcodes() => toShortcodes(Platform.Github);

  /// Converts the [_value] String to shortcodes compatible with Slack platform.
  /// Returns the resulting String.
  String toSlackShortcodes() => toShortcodes(Platform.Slack);

  /// Returns the parsed String with all emoji characters replaced by their
  /// shortcodes as used by the specified [Platform], or by themselves if there
  /// is no known shortcode for the given emoji on that platform.
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
  String fromShortcodes(
      {String Function(String unknownShortcode)? onUnknownShortcode}) {
    return _value.splitMapJoin(Regex.shortcode, onMatch: (m) {
      final match = m.group(0)!;
      return Emojis().getOneOrNull(match.removeColons())?.value ??
          onUnknownShortcode?.call(match) ??
          match;
    });
  }

  void forEach(void Function(Emoji emoji) action) => get.forEach(action);

  void forEachWhile(bool Function(Emoji emoji) action) {
    get.forEachWhile(action);
  }

  void forEachIndexed(void Function(int index, Emoji emoji) action) {
    get.forEachIndexed(action);
  }

  void forEachIndexedWhile(bool Function(int index, Emoji emoji) action) {
    get.forEachIndexedWhile(action);
  }

  List<Emoji> map(Emoji Function(Emoji emoji) toElement) {
    return get.map(toElement).toUnmodifiableList();
  }

  List<Emoji> mapIndexed(Emoji Function(int index, Emoji emoji) convert) {
    return get.mapIndexed(convert).toUnmodifiableList();
  }

  List<Emoji> where(bool Function(Emoji emoji) test) {
    return get.where(test).toUnmodifiableList();
  }

  List<Emoji> whereIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereIndexed(test).toUnmodifiableList();
  }

  List<Emoji> whereNot(bool Function(Emoji emoji) test) {
    return get.whereNot(test).toUnmodifiableList();
  }

  List<Emoji> whereNotIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereNotIndexed(test).toUnmodifiableList();
  }

  T fold<T>(T initialValue, T Function(T previousValue, Emoji emoji) combine) {
    return get.fold(initialValue, combine);
  }

  T foldIndexed<T>(
    T initialValue,
    T Function(int index, T previousValue, Emoji emoji) combine,
  ) {
    return get.foldIndexed(initialValue, combine);
  }

  Emoji firstWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhere(test, orElse: orElse);
  }

  Emoji firstWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhereIndexed(test, orElse: orElse);
  }

  Emoji? firstWhereOrNull(bool Function(Emoji emoji) test) {
    return get.firstWhereOrNull(test);
  }

  Emoji? firstWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.firstWhereIndexedOrNull(test);
  }

  Emoji lastWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhere(test, orElse: orElse);
  }

  Emoji lastWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhereIndexed(test, orElse: orElse);
  }

  Emoji? lastWhereOrNull(bool Function(Emoji emoji) test) {
    return get.lastWhereOrNull(test);
  }

  Emoji? lastWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.lastWhereIndexedOrNull(test);
  }

  List<Emoji> take(int count) => get.take(count).toUnmodifiableList();

  List<Emoji> takeLast(int count) => get.takeLast(count).toUnmodifiableList();

  List<Emoji> takeWhile(bool Function(Emoji emoji) test) {
    return get.takeWhile(test).toUnmodifiableList();
  }

  List<Emoji> skip(int count) => get.skip(count).toUnmodifiableList();

  List<Emoji> skipWhile(bool Function(Emoji emoji) test) {
    return get.skipWhile(test).toUnmodifiableList();
  }

  List<Emoji> skipLast(int count) => get.skipLast(count).toUnmodifiableList();

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

  bool any(bool Function(Emoji emoji) test) => get.any(test);

  bool some(bool Function(Emoji emoji) test) => get.any(test);

  bool someOf(List<String> emojis) => emojis.none(_value.contains);

  bool none(bool Function(Emoji emoji) test) => get.none(test);

  bool noneOf(List<String> emojis) => emojis.none(_value.contains);

  bool every(bool Function(Emoji emoji) test) => get.every(test);

  bool containsOnly(bool Function(Emoji emoji) test) {
    return where(test).isNotEmpty && whereNot(test).isEmpty;
  }

  bool containsOnlyOf(List<String> emojis) {
    return emojis.every((e) => extract.contains(e)) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }

  bool containsOnlyOne(bool Function(Emoji emoji) test) {
    return where(test).length == 1 && whereNot(test).isEmpty;
  }

  bool containsOnlyOneOf(Set<String> emojis) {
    return emojis
            .every((e) => extract.where((value) => value == e).length == 1) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }
}
