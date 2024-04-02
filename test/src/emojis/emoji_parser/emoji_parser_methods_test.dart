import 'package:emoji_extension/src/emojis/emoji_parser/emoji_parser.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

// ignore_for_file: deprecated_member_use_from_same_package
void main() {
  group('EmojiParserMethods', () {
    $({
      (e) => e.value == '😀': 'text👍🏻text🤦🏾‍♀️text',
      (e) => false: '😀text👍🏻text🤦🏾‍♀️text😀',
    }).forEach((input, expected) {
      test(
          'removeWhere() returns correct text without emoji when condition is met',
          () {
        const text = '😀text👍🏻text🤦🏾‍♀️text😀';
        final value = EmojiParser(text).removeWhere(input);
        expect(value, expected);
      });
    });

    $({
      (e) => e.value == '👍🏻': ['😀text', 'text😀'],
      (e) => false: ['😀text👍🏻text😀'],
    }).forEach((input, expected) {
      test(
          'splitWhere() returns correct text without emoji when condition is met',
          () {
        const text = '😀text👍🏻text😀';
        final value = EmojiParser(text).splitWhere(input);
        expect(value, expected);
      });
    });

    $({
      '': false,
      'text': false,
      '🫡 ': false,
      '😀': true,
      '🤦🏾‍♀️': true,
      '😀 🤦🏽 😀': true,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': true,
    }).forEach((input, expected) {
      test('anyOf(😀,🤦🏾‍♀️) returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).anyOf(['😀', '🤦🏾‍♀️']);
        expect(value, expected);
      });
    });

    $({
      '': false,
      'text': false,
      '🫡 ': false,
      '😀': false,
      '🤦🏾‍♀️': false,
      '😀 🤦🏾‍♀️ 😀': true,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': true,
      'text😀text🤦🏾‍♀️text😀': true,
    }).forEach((input, expected) {
      test('everyOf(😀,🤦🏾‍♀️) returns $expected when content is: [$input]',
          () {
        final value = EmojiParser(input).everyOf(['😀', '🤦🏾‍♀️']);
        expect(value, expected);
      });
    });

    test('splitMapJoin() returns correct value', () {
      final value = EmojiParser('text😀text').splitMapJoin(
        onMatch: (_) => '_emoji_',
        onNonMatch: (s) => s.toUpperCase(),
      );
      expect(value, 'TEXT_emoji_TEXT');
    });

    String buildText() {
      final buffer = StringBuffer();
      for (final e in TestEmojis.values) {
        buffer.write('${e}text');
      }
      return buffer.toString();
    }

    test('replace() returns correct text with chosen text in place of emoji',
        () {
      const text = '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt';
      final value = EmojiParser(text).replace('_');
      const expected = '_️te_xt_te_xt_te_xt';
      expect(value, expected);
    });

    $({
      {'😀': 'A', '👍🏻': 'B'}: 'AtextBtext🤦🏾‍♀️textA',
      <String, String>{}: '😀text👍🏻text🤦🏾‍♀️text😀',
      {'😀text': '1', 'te': '2', 'xt': '3'}: '😀text👍🏻text🤦🏾‍♀️text😀',
    }).forEach((input, expected) {
      test(
          'replaceWith() returns correct text with chosen replacement for each emoji',
          () {
        const text = '😀text👍🏻text🤦🏾‍♀️text😀';
        final value = EmojiParser(text).replaceWith(input);
        expect(value, expected);
      });
    });

    $({
      (e) => {'😀': 'A', '👍🏻': 'B'}[e.value]: 'AtextBtext🤦🏾‍♀️textA',
      (e) => e.value == '👍🏻' ? '_OK_' : null: '😀text_OK_text🤦🏾‍♀️text😀',
      (e) => null: '😀text👍🏻text🤦🏾‍♀️text😀',
    }).forEach((input, expected) {
      test(
          'replaceWhere() returns correct text with chosen replacement for each emoji',
          () {
        const text = '😀text👍🏻text🤦🏾‍♀️text😀';
        final value = EmojiParser(text).replaceWhere(input);
        expect(value, expected);
      });
    });

    test(
        'toCLDRShortcodes() returns correct text with shortcode in place of emoji',
        () {
      const text = 'text😀text🤦🏾‍♀️text😀';
      final value = EmojiParser(text).toCLDRShortcodes();
      const expected =
          'text:grinning_face:text:woman_facepalming_tone4:text:grinning_face:';
      expect(value, expected);
    });

    test(
        'toDiscordShortcodes() returns correct text with shortcode in place of emoji',
        () {
      const text = 'text😀text🤦🏾‍♀️text😀';
      final value = EmojiParser(text).toDiscordShortcodes();
      const expected =
          'text:grinning:text:woman_facepalming_tone4:text:grinning:';
      expect(value, expected);
    });

    test(
        'toGithubShortcodes() returns correct text with shortcode in place of emoji',
        () {
      const text = 'text😀text🤦🏾‍♀️text😀';
      final value = EmojiParser(text).toGithubShortcodes();
      const expected = 'text:grinning:text🤦🏾‍♀️text:grinning:';
      expect(value, expected);
    });

    test(
        'toSlackShortcodes() returns correct text with shortcode in place of emoji',
        () {
      const text = 'text😀text🤦🏾‍♀️text😀';
      final value = EmojiParser(text).toSlackShortcodes();
      const expected =
          'text:grinning:text:woman-facepalming::skin-tone-5:text:grinning:';
      expect(value, expected);
    });

    test('toShortcodes() returns correct text with shortcode in place of emoji',
        () {
      const text = 'text😀text🤦🏾‍♀️text😀';
      final value = EmojiParser(text).toShortcodes();
      const expected =
          'text:grinning_face:text:woman_facepalming_medium_dark_skin_tone:text:grinning_face:';
      expect(value, expected);
    });

    test(
        'fromShortcodes() returns correct text with emoji in place of shortcode',
        () {
      const text =
          'text: :woman_facepalming_tone4:text:woman_facepalming_medium_dark_skin_tone:text:woman-facepalming::skin-tone-5:text:';
      final value = EmojiParser(text).fromShortcodes();
      const expected = 'text: 🤦🏾‍♀️text🤦🏾‍♀️text🤦🏾‍♀️text:';
      expect(value, expected);
    });

    test(
        'fromShortcodes() returns correct text with emoji in place of shortcode when emojis are chained (without skin tone)',
        () {
      const text =
          ':otter::woman-facepalming::santa::dancer::female-astronaut:';
      final value = EmojiParser(text).fromShortcodes();
      const expected = '🦦🤦‍♀️🎅💃👩‍🚀';
      expect(value, expected);
    });

    test(
        'fromShortcodes() returns correct text with emoji in place of shortcode when emojis are chained',
        () {
      const text =
          ':otter::woman-facepalming::skin-tone-5::santa::dancer::skin-tone-4::female-astronaut::skin-tone-5:';
      final value = EmojiParser(text).fromShortcodes();
      const expected = '🦦🤦🏾‍♀️🎅💃🏽👩🏾‍🚀';
      expect(value, expected);
    });

    test(
        'fromShortcodes() returns this raw shortcode when the shortcode does not exist and no replacement method is provided',
        () {
      const text = ':man: :this-shortcode-does-not-exist: :woman:';
      final value = EmojiParser(text).fromShortcodes();
      const expected = '👨 :this-shortcode-does-not-exist: 👩';
      expect(value, expected);
    });

    test(
        'fromShortcodes() returns this replacement text when shortcode cannot be found and a replacement method is provided',
        () {
      const text = ':man: :this-shortcode-does-not-exist: :woman:';
      final value =
          EmojiParser(text).fromShortcodes(onUnknownShortcode: (_) => '🤷');
      const expected = '👨 🤷 👩';
      expect(value, expected);
    });

    test('forEach iterates correctly over each emoji in given text', () {
      const text = 'text😀text🤦🏾‍♀️text';
      final iterator = [
        TestEmojis.grinningFace,
        TestEmojis.womanFacepalmingMediumDarkSkinTone
      ].iterator
        ..moveNext();

      EmojiParser(text).forEach((emoji) {
        expect(emoji, iterator.current);
        iterator.moveNext();
      });

      expect(iterator.moveNext(), isFalse);
    });
  });
}
