part of 'emoji_parser.dart';

extension EmojiParserGetters on EmojiParser {
  /// Determines if the String value contains any emojis.
  bool get contains => Regex.emoji.hasMatch(_value);

  /// Determines if the String value contains only emojis and no
  /// other characters.
  bool get only => extract.isNotEmpty && remove.trim().isEmpty;

  /// Determines if the String value contains only one emoji and no
  /// other characters.
  bool get onlyOne => count == 1 && remove.trim().isEmpty;

  /// Gets the count of the number of emojis in the String value.
  int get count => extract.length;

  /// Gets a new String value with all emojis removed from the original
  /// String value.
  String get remove => replace('');

  /// Splits the String value into a list of substrings, splitting on
  /// emoji characters.
  List<String> get split => _value.split(Regex.emoji);

  /// Gets a list of [Emoji] objects corresponding to the emojis in the
  /// String value.
  List<Emoji> get get => extract.map((e) => Emojis().getOne(e)).toList();

  /// Extracts all emojis from the String value and returns them in a list.
  List<String> get extract {
    return Regex.emoji.allMatches(_value).map((m) => m.group(0)!).toList();
  }

  Emoji get first => get.first;

  Emoji? get firstOrNull => get.firstOrNull;

  Emoji get second => get.second;

  Emoji? get secondOrNull => get.secondOrNull;

  Emoji get third => get.third;

  Emoji? get thirdOrNull => get.thirdOrNull;

  Emoji get fourth => get.fourth;

  Emoji? get fourthOrNull => get.fourthOrNull;

  Emoji get fifth => get.fifth;

  Emoji? get fifthOrNull => get.fifthOrNull;

  Emoji get sixth => get.sixth;

  Emoji? get sixthOrNull => get.sixthOrNull;

  Emoji get penultimate => get.penultimate;

  Emoji? get penultimateOrNull => get.penultimateOrNull;

  Emoji get last => get.last;

  Emoji? get lastOrNull => get.lastOrNull;

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
