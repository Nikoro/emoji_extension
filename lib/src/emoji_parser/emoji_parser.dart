import 'package:collection/collection.dart';
import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:emoji_extension/src/regex.dart';

part 'emoji_parser_getters.dart';
part 'emoji_parser_methods.dart';

/// A class for parsing and manipulating emojis within a given String value.
class EmojiParser {
  /// Constructs an instance of [EmojiParser] with the given String value to parse.
  EmojiParser(this._value);

  /// The private String value being parsed and manipulated by
  /// this [EmojiParser] instance.
  final String _value;
}
