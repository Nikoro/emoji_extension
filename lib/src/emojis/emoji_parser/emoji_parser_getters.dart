part of 'emoji_parser.dart';

/// Extension providing various utility getters for Emoji parsing.
extension EmojiParserGetters on EmojiParser {
  /// Determines if the String value contains any emojis.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.contains; // true
  /// 'text'.emojis.contains; // false
  /// ```
  bool get contains => Regex.emoji.hasMatch(_value);

  /// Determines if the String value contains only emojis and no other characters.
  ///
  /// Example:
  /// ```dart
  /// '🟡'.emojis.only; // true
  /// '🟡 ❤️ 🟦 🟢'.emojis.only; // true
  /// '🟡text❤️text🟦text🟢'.emojis.only; // false
  /// 'text'.emojis.only; // false
  /// ```
  bool get only => extract.isNotEmpty && remove.trim().isEmpty;

  /// Determines if the String value contains only one emoji and no other characters.
  ///
  /// Example:
  /// ```dart
  /// '🟡'.emojis.onlyOne; // true
  /// '🟡 ❤️ 🟦 🟢'.emojis.onlyOne; // false
  /// '🟡text❤️text🟦text🟢'.emojis.onlyOne; // false
  /// 'text'.emojis.onlyOne; // false
  /// ```
  bool get onlyOne => count == 1 && remove.trim().isEmpty;

  /// Gets the number of emojis in the String value.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.count; // 4
  /// ```
  int get count => extract.length;

  /// Gets a new String value with all emojis removed from the original String value.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.remove; // texttexttext
  /// ```
  String get remove => replace('');

  /// Splits the String value into a list of substrings, splitting on emoji characters.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.split; // [text, text, text]
  /// ```
  List<String> get split => _value.split(Regex.emoji);

  /// Gets a list of [Emoji] objects corresponding to the emojis in the String value.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.get; // [Emoji(value: 🟡, ...), Emoji(value: ❤️, ...), ...]
  /// ```
  List<Emoji> get get => extract.map((e) => Emojis().getOne(e)).toList();

  /// Extracts all emojis from the String value and returns them in a list.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.extract; // [🟡, ❤️, 🟦, 🟢]
  /// ```
  List<String> get extract {
    return Regex.emoji.allMatches(_value).map((m) => m.group(0)!).toList();
  }

  /// Gets the first emoji in the String value.
  ///
  /// Throws a [StateError] if the String value has no emojis.
  ///
  /// Example:
  /// ```dart
  /// '🔴te👍️xt👍🏻te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.first; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get first => get.first;

  /// Gets the first emoji in the String value, or null if the String value is empty.
  ///
  /// Example:
  /// ```dart
  /// '🔴te👍️xt👍🏻te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.firstOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.firstOrNull; // null
  /// ```
  Emoji? get firstOrNull => get.firstOrNull;

  /// Gets the second emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 2 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te🔴xt👍🏻te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.second; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get second => get.second;

  /// Gets the second emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te🔴xt👍🏻te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.secondOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.secondOrNull; // null
  /// ```
  Emoji? get secondOrNull => get.secondOrNull;

  /// Gets the third emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 3 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt🔴te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.third; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get third => get.third;

  /// Gets the third emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt🔴te👍🏼xt👍🏽te👍🏾xt👍🏿'.emojis.thirdOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.thirdOrNull; // null
  /// ```
  Emoji? get thirdOrNull => get.thirdOrNull;

  /// Gets the fourth emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 4 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te🔴xt👍🏽te👍🏾xt👍🏿'.emojis.fourth; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get fourth => get.fourth;

  /// Gets the fourth emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te🔴xt👍🏽te👍🏾xt👍🏿'.emojis.fourthOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.fourthOrNull; // null
  /// ```
  Emoji? get fourthOrNull => get.fourthOrNull;

  /// Gets the fifth emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 5 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏾xt👍🏿'.emojis.fifth; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get fifth => get.fifth;

  /// Gets the fifth emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏾xt👍🏿'.emojis.fifthOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.fifthOrNull; // null
  /// ```
  Emoji? get fifthOrNull => get.fifthOrNull;

  /// Gets the sixth emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 6 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt👍🏿'.emojis.sixth; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get sixth => get.sixth;

  /// Gets the sixth emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt👍🏿'.emojis.sixthOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.sixthOrNull; // null
  /// ```
  Emoji? get sixthOrNull => get.sixthOrNull;

  /// Gets the penultimate emoji in the String value.
  ///
  /// Throws a [RangeError] if the String value contains less than 2 emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt👍🏿'.emojis.penultimate; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get penultimate => get.penultimate;

  /// Gets the penultimate emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt👍🏿'.emojis.penultimateOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.penultimateOrNull; // null
  /// ```
  Emoji? get penultimateOrNull => get.penultimateOrNull;

  /// Gets the last emoji in the String value.
  ///
  /// Throws a [StateError] if the String value has no emojis.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt🔴'.emojis.last; // Emoji(value: 🔴, ...)
  /// ```
  Emoji get last => get.last;

  /// Gets the last emoji in the String value, or null if it doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt🔴'.emojis.lastOrNull; // Emoji(value: 🔴, ...)
  /// 'text'.emojis.lastOrNull; // null
  /// ```
  Emoji? get lastOrNull => get.lastOrNull;

  /// Shuffles emojis within the String value and returns the shuffled String.
  ///
  /// Example:
  /// ```dart
  /// '🟡text❤️text🟦text🟢'.emojis.shuffle; // 🟦text🟢text🟡text❤️
  /// ```
  String get shuffle {
    String output = _value;
    extract.forEachIndexed((i, e) {
      output = output.replaceFirst(e, '[$i]');
    });
    extract.shuffled.forEachIndexed((i, e) {
      output = output.replaceFirst('[$i]', e);
    });

    return output;
  }
}
