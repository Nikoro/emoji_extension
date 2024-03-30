part of 'emoji_parser.dart';

extension EmojiParserGetters on EmojiParser {
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
