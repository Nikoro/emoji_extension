import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

void main() {
  group('EmojiParserGetters', () {
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
      '': '',
      'text': 'text',
      '🔴👍🏻👍🏼👍🏽👍🏾👍🏿': '👍🏻👍🏼👍🏽👍🏾👍🏿',
      '🔴te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt': 'te👍🏻xt👍🏼te👍🏽xt👍🏾te👍🏿xt',
    }).forEach((input, expected) {
      test('removeFirst returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeFirst;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️🔴👍🏼👍🏽👍🏾👍🏿': '👍️👍🏼👍🏽👍🏾👍🏿',
      '👍️te🔴xt👍🏼te👍🏽xt👍🏾te👍🏿xt': '👍️text👍🏼te👍🏽xt👍🏾te👍🏿xt',
    }).forEach((input, expected) {
      test('removeSecond returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeSecond;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻🔴👍🏽👍🏾👍🏿': '👍️👍🏻👍🏽👍🏾👍🏿',
      '👍️te👍🏻xt🔴te👍🏽xt👍🏾te👍🏿xt': '👍️te👍🏻xtte👍🏽xt👍🏾te👍🏿xt',
    }).forEach((input, expected) {
      test('removeThird returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeThird;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻👍🏼🔴👍🏾👍🏿': '👍️👍🏻👍🏼👍🏾👍🏿',
      '👍️te👍🏻xt👍🏼te🔴xt👍🏾te👍🏿xt': '👍️te👍🏻xt👍🏼text👍🏾te👍🏿xt',
    }).forEach((input, expected) {
      test('removeFourth returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeFourth;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻👍🏼👍🏽🔴👍🏿': '👍️👍🏻👍🏼👍🏽👍🏿',
      '👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt': '👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt',
    }).forEach((input, expected) {
      test('removeFifth returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeFifth;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻👍🏼👍🏽👍🏾🔴': '👍️👍🏻👍🏼👍🏽👍🏾',
      '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt': '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text',
    }).forEach((input, expected) {
      test('removeSixth returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeSixth;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻👍🏼👍🏽🔴👍🏿': '👍️👍🏻👍🏼👍🏽👍🏿',
      '👍️te👍🏻xt👍🏼te👍🏽xt🔴te👍🏿xt': '👍️te👍🏻xt👍🏼te👍🏽xtte👍🏿xt',
    }).forEach((input, expected) {
      test('removePenultimate returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removePenultimate;
        expect(value, expected);
      });
    });

    $({
      '': '',
      'text': 'text',
      '👍️👍🏻👍🏼👍🏽👍🏾🔴': '👍️👍🏻👍🏼👍🏽👍🏾',
      '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾te🔴xt': '👍️te👍🏻xt👍🏼te👍🏽xt👍🏾text',
    }).forEach((input, expected) {
      test('removeLast returns $expected when content is: [$input]', () {
        final value = EmojiParser(input).removeLast;
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

    test('get returns list of emojis from given text', () {
      const text = '😀text🤦🏾‍♀️';
      final value = EmojiParser(text).get;
      final expected = [
        TestEmojis.grinningFace,
        TestEmojis.womanFacepalmingMediumDarkSkinTone
      ];
      expect(value, expected);
    });

    group('first', () {
      test('returns first emoji from given text', () {
        const text = '😀text';

        final value = EmojiParser(text).first;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws State Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).first, throwsStateError);
      });
    });

    group('firstOrNull', () {
      test('returns first emoji from given text', () {
        const text = '😀text';

        final value = EmojiParser(text).firstOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).firstOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('second', () {
      test('returns second emoji from given text', () {
        const text = '👍text😀';

        final value = EmojiParser(text).second;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).second, throwsA(isRangeError));
      });
    });

    group('secondOrNull', () {
      test('returns second emoji from given text', () {
        const text = '👍text😀';

        final value = EmojiParser(text).secondOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).secondOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('third', () {
      test('returns third emoji from given text', () {
        const text = '👍te👍🏻xt😀';

        final value = EmojiParser(text).third;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).third, throwsA(isRangeError));
      });
    });

    group('thirdOrNull', () {
      test('returns third emoji from given text', () {
        const text = '👍te👍🏻xt😀';

        final value = EmojiParser(text).thirdOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).thirdOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('fourth', () {
      test('returns fourth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te😀xt';

        final value = EmojiParser(text).fourth;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).fourth, throwsA(isRangeError));
      });
    });

    group('fourthOrNull', () {
      test('returns fourth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te😀xt';

        final value = EmojiParser(text).fourthOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).fourthOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('fifth', () {
      test('returns fifth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te👍🏽xt😀';

        final value = EmojiParser(text).fifth;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).fifth, throwsA(isRangeError));
      });
    });

    group('fifthOrNull', () {
      test('returns fifth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te👍🏽xt😀';

        final value = EmojiParser(text).fifthOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).fifthOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('sixth', () {
      test('returns sixth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te👍🏽xt👍🏾te😀xt';

        final value = EmojiParser(text).sixth;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).sixth, throwsA(isRangeError));
      });
    });

    group('sixthOrNull', () {
      test('returns sixth emoji from given text', () {
        const text = '👍te👍🏻xt👍🏼te👍🏽xt👍🏾te😀xt';

        final value = EmojiParser(text).sixthOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).sixthOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('penultimate', () {
      test('returns penultimate emoji from given text', () {
        const text = '😀text👍';

        final value = EmojiParser(text).penultimate;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws Range Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).penultimate, throwsA(isRangeError));
      });
    });

    group('penultimateOrNull', () {
      test('returns penultimate emoji from given text', () {
        const text = '😀text👍';

        final value = EmojiParser(text).penultimateOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).penultimateOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    group('last', () {
      test('returns last emoji from given text', () {
        const text = '👍text😀';

        final value = EmojiParser(text).last;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('throws State Error when there is no emoji in given text', () {
        const text = 'text';
        expect(() => EmojiParser(text).last, throwsStateError);
      });
    });

    group('lastOrNull', () {
      test('returns last emoji from given text', () {
        const text = '👍text😀';

        final value = EmojiParser(text).lastOrNull;
        final expected = TestEmojis.grinningFace;
        expect(value, expected);
      });

      test('returns null when there is no emoji in given text', () {
        const text = 'text';
        final value = EmojiParser(text).lastOrNull;
        const expected = null;
        expect(value, expected);
      });
    });

    test('shuffle returns same text with same emojis, but shuffled', () {
      const text = '🟡text❤️text🟦text🔶';
      final value = EmojiParser(text).shuffle;
      final isSameText = text.emojis.remove == value.emojis.remove;
      expect(isSameText, true);
      final areSameEmojisWithPotentiallyDifferentOrder =
          const DeepCollectionEquality.unordered()
              .equals(text.emojis.extract, value.emojis.extract);
      expect(areSameEmojisWithPotentiallyDifferentOrder, true);
    });
  });
}
