import 'package:emoji_extension/src/emojis/emoji_parser.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('EmojiParser', () {
    $({
      '😀': true,
      '🫡 ': true,
      '🤦🏾‍♀️': true,
      '😀 🤦🏽 😀': true,
      '  😀 😀🤦🏽😀 ': true,
      'text😀': true,
      '😀text': true,
      'text😀te🤦🏽xt': true,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': true,
      '': false,
      'text': false,
    }).forEach((input, expected) {
      test('any returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).any;
        expect(value, expected);
      });
    });

    $({
      '😀': true,
      '🫡 ': true,
      '🤦🏾‍♀️': true,
      '😀 🤦🏽 😀': true,
      '  😀 😀🤦🏽😀 ': true,
      'text😀': true,
      '😀text': true,
      'text😀te🤦🏽xt': true,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': true,
      '': false,
      'text': false,
    }).forEach((input, expected) {
      test('contains returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).contains;
        expect(value, expected);
      });
    });

    $({
      '😀': true,
      '🫡 ': true,
      '🤦🏾‍♀️': true,
      '😀 🤦🏽 😀': true,
      '  😀 😀🤦🏽😀 ': true,
      'text😀': false,
      '😀text': false,
      'text😀te🤦🏽xt': false,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': false,
    }).forEach((input, expected) {
      test('only returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).only;
        expect(value, expected);
      });
    });

    $({
      '😀': true,
      '🫡 ': true,
      '🤦🏾‍♀️': true,
      '😀 🤦🏽 😀': false,
      '  😀 😀🤦🏽😀 ': false,
      'text😀': false,
      '😀text': false,
      'text': false,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': false,
    }).forEach((input, expected) {
      test('onlyOne returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).onlyOne;
        expect(value, expected);
      });
    });

    $({
      '': 0,
      'text': 0,
      '😀': 1,
      '🫡 ': 1,
      '🤦🏾‍♀️': 1,
      '😀 🤦🏽 😀': 3,
      'te🤦🏾‍♀️xt😀te🤦🏽xt': 3,
    }).forEach((input, expected) {
      test('count returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).count;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '😀': '',
      '🫡 ': ' ',
      '🤦🏾‍♀️': '',
      '😀 🤦🏽 😀': '  ',
      'te🤦🏾‍♀️xt😀te🤦🏽xt': 'texttext',
    }).forEach((input, expected) {
      test('remove returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).remove;
        expect(value, expected);
      });
    });

    $({
      '😀': ['', ''],
      'text': ['text'],
      'a😀b🤦🏽c😀d': ['a', 'b', 'c', 'd'],
      'te🤦🏾‍♀️xt😀te🤦🏽xt': ['te', 'xt', 'te', 'xt']
    }).forEach((input, expected) {
      test('split returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).split;
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
      test('hasAny(😀,🤦🏾‍♀️) returns $expected when content is: [$input]',
          () {
        final value = EmojiParser(input).hasAny(['😀', '🤦🏾‍♀️']);
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
      test('anyOf(😀,🤦🏾‍♀️) returns $expected when content is: [$input]',
              () {
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
      test('hasEach(😀,🤦🏾‍♀️) returns $expected when content is: [$input]',
          () {
        final value = EmojiParser(input).hasEach(['😀', '🤦🏾‍♀️']);
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

    test('extract returns correct list of emojis from String', () {
      const expected = TestEmojis.values;
      final text = buildText();
      final value = EmojiParser(text).extract;
      expect(value, expected);
    });

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
          'replaceEach() returns correct text with chosen replacement for each emoji',
              () {
            const text = '😀text👍🏻text🤦🏾‍♀️text😀';
            final value = EmojiParser(text).replaceEach(input);
            expect(value, expected);
          });
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

    test('get returns list of emojis from given text', () {
      const text = 'text😀text🤦🏾‍♀️text';
      final value = EmojiParser(text).get;
      final expected = [
        TestEmojis.grinningFace,
        TestEmojis.womanFacepalmingMediumDarkSkinTone
      ];
      expect(value, expected);
    });
  });
}
