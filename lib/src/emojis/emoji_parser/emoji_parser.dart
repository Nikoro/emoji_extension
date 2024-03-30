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

  /// Determines if the String value contains any emojis.
  @Deprecated('Use "contains" instead.')
  bool get any => contains;

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

  /// Splits the String value into a list of substrings, splitting on
  /// emoji characters.
  List<String> get split => _value.split(Regex.emoji);

  /// Splits the String into a list of substrings based on the provided [split]
  /// function that determines where to split the string.
  List<String> splitWhere(bool Function(Emoji e) split) {
    final valuesToSplit =
        get.distinct().where(split).toUnmodifiableList().values;
    return valuesToSplit.isNotEmpty
        ? _value.split(RegExp(valuesToSplit.join('|')))
        : [_value];
  }

  /// Gets a list of [Emoji] objects corresponding to the emojis in the
  /// String value.
  List<Emoji> get get => extract.map((e) => Emojis().getOne(e)).toList();

  /// Extracts all emojis from the String value and returns them in a list.
  List<String> get extract {
    return Regex.emoji.allMatches(_value).map((m) => m.group(0)!).toList();
  }

  /// Determines if the String value contains any of the given emojis.
  @Deprecated('Use "anyOf" instead.')
  bool hasAny(List<String> emojis) => anyOf(emojis);

  /// Determines if the String value contains any of the given emojis.
  bool anyOf(List<String> emojis) => emojis.any(_value.contains);

  /// Determines if the String value contains all of the given emojis.
  @Deprecated('Use "everyOf" instead.')
  bool hasEach(List<String> emojis) => everyOf(emojis);

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
  @Deprecated('Use "replaceWith" instead.')
  String replaceEach(Map<String, String> emojiToReplacement) {
    return replaceWith(emojiToReplacement);
  }

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
}