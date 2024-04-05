import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

void main() {
  group('EmojiParserMethods', () {
    $({
      (e) => e.value == '❤️': 1,
      (Emoji e) => e.name.contains('Circle'): 2,
    }).forEach((input, expected) {
      test(
          'countWhere() returns correct number of emojis when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).countWhere(input);
        expect(value, expected);
      });
    });

    $({
      (i, e) => i == 1 && e.value == '❤️': 1,
      (i, e) => i == 0 && e.name.contains('Circle'): 1,
    }).forEach((input, expected) {
      test(
          'countWhereIndexed() returns correct number of emojis when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).countWhereIndexed(input);
        expect(value, expected);
      });
    });

    $({
      1: '🟡texttext🟦text🟢',
      10: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test('removeAt() returns correct text without emoji on provided position',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).removeAt(input);
        expect(value, expected);
      });
    });

    $({
      1: '🟡text❤️texttext🟢',
      10: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'removeFromEnd() returns correct text without emoji on provided position',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).removeFromEnd(input);
        expect(value, expected);
      });
    });

    $({
      ['❤️', '🟦']: '🟡texttexttext🟢',
      ['🔶']: '🟡text❤️text🟦text🟢',
      <String>[]: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'removeEveryOf() returns correct text without emojis specified in the list',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).removeEveryOf(input);
        expect(value, expected);
      });
    });

    $({
      (e) => e.value == '❤️': '🟡texttext🟦text🟢',
      (Emoji e) => e.name.contains('Circle'): 'text❤️text🟦text',
      (e) => false: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'removeWhere() returns correct text without emoji when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).removeWhere(input);
        expect(value, expected);
      });
    });

    $({
      (i, e) => i == 1 && e.value == '❤️': '🟡texttext🟦text🟢',
      (i, e) => i == 0 && e.name.contains('Circle'): 'text❤️text🟦text🟢',
      (i, e) => false: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'removeWhereIndexed() returns correct text without emoji when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).removeWhereIndexed(input);
        expect(value, expected);
      });
    });

    $({
      (e) => e.value == '❤️': ['🟡text', 'text🟦text🟢'],
      (e) => false: ['🟡text❤️text🟦text🟢'],
    }).forEach((input, expected) {
      test(
          'splitWhere() returns correct text without emoji when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).splitWhere(input);
        expect(value, expected);
      });
    });

    $({
      (i, e) => i == 1 && e.value == '❤️': ['🟡text', 'text🟦text🟢'],
      (i, e) => false: ['🟡text❤️text🟦text🟢'],
    }).forEach((input, expected) {
      test(
          'splitWhereIndexed() returns correct text without emoji when condition is met',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).splitWhereIndexed(input);
        expect(value, expected);
      });
    });

    test('splitMapJoin() returns correct value', () {
      final value = EmojiParser('🟡text❤️text🟦text🟢').splitMapJoin(
        onMatch: (_) => '_emoji_',
        onNonMatch: (s) => s.toUpperCase(),
      );
      expect(value, '_emoji_TEXT_emoji_TEXT_emoji_TEXT_emoji_');
    });

    test('replace() returns correct text with chosen text in place of emoji',
        () {
      const text = '🟡text❤️text🟦text🟢';
      final value = EmojiParser(text).replace('-');
      const expected = '-text-text-text-';
      expect(value, expected);
    });

    $({
      {'🟡': 'ABC', '❤️': '123'}: 'ABCtext123text🟦text🟢',
      <String, String>{}: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'replaceWith() returns correct text with chosen replacement for each emoji',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).replaceWith(input);
        expect(value, expected);
      });
    });

    $({
      (e) => {'🟡': 'ABC', '❤️': '123'}[e.value]: 'ABCtext123text🟦text🟢',
      (e) => e.value == '❤️' ? '123' : null: '🟡text123text🟦text🟢',
      (e) => e.name.contains('Circle') ? '123' : null: '123text❤️text🟦text123',
      (e) => null: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'replaceWhere() returns correct text with chosen replacement for each emoji',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).replaceWhere(input);
        expect(value, expected);
      });
    });

    $({
      (i, e) => i == 1 ? '123' : null: '🟡text123text🟦text🟢',
      (i, e) => i == 0 && e.name.contains('Circle') ? '123' : null:
          '123text❤️text🟦text🟢',
      (i, e) => null: '🟡text❤️text🟦text🟢',
    }).forEach((input, expected) {
      test(
          'replaceWhereIndexed() returns correct text with chosen replacement for each emoji',
          () {
        const text = '🟡text❤️text🟦text🟢';
        final value = EmojiParser(text).replaceWhereIndexed(input);
        expect(value, expected);
      });
    });

    test('forEach() applies action to each emoji', () {
      final expected = ['🟡', '❤️', '🟦', '🟢'];
      const text = '🟡text❤️text🟦text🟢';
      final list = [];

      EmojiParser(text).forEach((e) => list.add(e.value));

      expect(list, equals(expected));
    });

    test('forEachWhile() applies action to each emoji', () {
      final expected = ['🟡', '❤️'];
      const text = '🟡text❤️text🟦text🟢';
      final list = [];

      EmojiParser(text).forEachWhile((e) {
        list.add(e.value);
        return e.value == '🟡';
      });

      expect(list, equals(expected));
    });

    test('forEachIndexed() applies action to each emoji', () {
      final expected = ['0:🟡', '1:❤️', '2:🟦', '3:🟢'];
      const text = '🟡text❤️text🟦text🟢';
      final list = [];

      EmojiParser(text).forEachIndexed((i, e) => list.add('$i:${e.value}'));

      expect(list, equals(expected));
    });

    test('forEachIndexedWhile() applies action to each emoji', () {
      final expected = ['0:🟡', '1:❤️'];
      const text = '🟡text❤️text🟦text🟢';
      final list = [];

      EmojiParser(text).forEachIndexedWhile((i, e) {
        list.add('$i:${e.value}');
        return e.value == '🟡';
      });

      expect(list, equals(expected));
    });

    test('map() applies function to each emoji', () {
      final expected = ['🟡', '❤️', '🟦', '🟢'];
      const text = '🟡text❤️text🟦text🟢';

      final result = EmojiParser(text).map((e) => e.value);

      expect(result, equals(expected));
    });

    test('mapIndexed() applies function to each emoji', () {
      final expected = ['0:🟡', '1:❤️', '2:🟦', '3:🟢'];
      const text = '🟡text❤️text🟦text🟢';

      final result = EmojiParser(text).mapIndexed((i, e) => '$i:${e.value}');

      expect(result, equals(expected));
    });

    $({
      (Emoji e) => e.name.contains('Circle'): ['🟡', '🟢'],
      (e) => e.value == '❤️': ['❤️'],
      (e) => false: [],
      (e) => true: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('where() filters emojis based on provided condition', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).where(input).values;
        expect(result, expected);
      });
    });

    $({
      (i, e) => i == 0 && e.name.contains('Circle'): ['🟡'],
      (i, e) => i == 1: ['❤️'],
      (i, e) => false: [],
      (i, e) => true: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('whereIndexed() filters emojis based on provided condition', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).whereIndexed(input).values;
        expect(result, expected);
      });
    });

    $({
      (Emoji e) => e.name.contains('Circle'): ['❤️', '🟦'],
      (e) => e.value == '❤️': ['🟡', '🟦', '🟢'],
      (e) => true: [],
      (e) => false: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('whereNot() filters emojis based on provided condition', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).whereNot(input).values;
        expect(result, expected);
      });
    });

    $({
      (i, e) => i == 0 && e.name.contains('Circle'): ['❤️', '🟦', '🟢'],
      (i, e) => i == 1: ['🟡', '🟦', '🟢'],
      (i, e) => true: [],
      (i, e) => false: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('whereNotIndexed() filters emojis based on provided condition', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).whereNotIndexed(input).values;
        expect(result, expected);
      });
    });

    test('fold combines elements with the provided function', () {
      const expected = 'text🟡❤️🟦🟢';
      const text = '🟡text❤️text🟦text🟢';

      final result = EmojiParser(text).fold('text', (p, c) => p + c.value);

      expect(result, expected);
    });

    test('foldIndexed combines elements with the provided function', () {
      const expected = 'text🟡0❤️1🟦2🟢3';
      const text = '🟡text❤️text🟦text🟢';

      final result =
          EmojiParser(text).foldIndexed('text', (i, p, c) => '$p${c.value}$i');

      expect(result, expected);
    });

    group('firstWhere', () {
      test('returns the first emoji that satisfies the condition', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text)
            .firstWhere((e) => e.name.contains('Circle'))
            .value;

        expect(result, '🟡');
      });

      test('returns the orElse value if condition is not satisfied', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text).firstWhere(
          (e) => e.value == '🔶',
          orElse: () => TestEmojis.grinningFace,
        );

        expect(result, TestEmojis.grinningFace);
      });

      test(
          'throws a StateError if condition is not satisfied and orElse is not provided',
          () {
        const text = '🟡text❤️text🟦text🟢';

        expect(
          () => EmojiParser(text).firstWhere((e) => e.value == '🔶'),
          throwsStateError,
        );
      });
    });

    group('firstWhereIndexed', () {
      test('returns the first emoji that satisfies the condition', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text)
            .firstWhereIndexed((i, e) => i > 0 && e.name.contains('Circle'))
            .value;

        expect(result, '🟢');
      });

      test('returns the orElse value if condition is not satisfied', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text).firstWhereIndexed(
          (i, e) => i == 5,
          orElse: () => TestEmojis.grinningFace,
        );

        expect(result, TestEmojis.grinningFace);
      });

      test(
          'throws a StateError if condition is not satisfied and orElse is not provided',
          () {
        const text = '🟡text❤️text🟦text🟢';

        expect(
          () => EmojiParser(text).firstWhereIndexed((i, e) => i == 5),
          throwsStateError,
        );
      });
    });

    $({
      (Emoji e) => e.name.contains('Circle'): '🟡',
      (e) => e.value == '🔶': null,
    }).forEach((input, expected) {
      test('firstWhereOrNull() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).firstWhereOrNull(input)?.value;
        expect(result, expected);
      });
    });

    $({
      (i, e) => i == 0 && e.name.contains('Circle'): '🟡',
      (i, e) => i == 0 && e.value == '❤️': null,
    }).forEach((input, expected) {
      test('firstWhereIndexedOrNull() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).firstWhereIndexedOrNull(input)?.value;
        expect(result, expected);
      });
    });

    group('lastWhere', () {
      test('returns the last emoji that satisfies the condition', () {
        const text = '🟡text❤️text🟦text🟢';

        final result =
            EmojiParser(text).lastWhere((e) => e.name.contains('Circle')).value;

        expect(result, '🟢');
      });

      test('returns the orElse value if condition is not satisfied', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text).lastWhere(
          (e) => e.value == '🔶',
          orElse: () => TestEmojis.grinningFace,
        );

        expect(result, TestEmojis.grinningFace);
      });

      test(
          'throws a StateError if condition is not satisfied and orElse is not provided',
          () {
        const text = '🟡text❤️text🟦text🟢';

        expect(
          () => EmojiParser(text).lastWhere((e) => e.value == '🔶'),
          throwsStateError,
        );
      });
    });

    group('lastWhereIndexed', () {
      test('returns the last emoji that satisfies the condition', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text)
            .lastWhereIndexed((i, e) => i < 1 && e.name.contains('Circle'))
            .value;

        expect(result, '🟡');
      });

      test('returns the orElse value if condition is not satisfied', () {
        const text = '🟡text❤️text🟦text🟢';

        final result = EmojiParser(text).lastWhereIndexed(
          (i, e) => i == 5,
          orElse: () => TestEmojis.grinningFace,
        );

        expect(result, TestEmojis.grinningFace);
      });

      test(
          'throws a StateError if condition is not satisfied and orElse is not provided',
          () {
        const text = '🟡text❤️text🟦text🟢';

        expect(
          () => EmojiParser(text).lastWhereIndexed((i, e) => i == 5),
          throwsStateError,
        );
      });
    });

    $({
      (Emoji e) => e.name.contains('Circle'): '🟢',
      (e) => e.value == '🔶': null,
    }).forEach((input, expected) {
      test('lastWhereOrNull() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).lastWhereOrNull(input)?.value;
        expect(result, expected);
      });
    });

    $({
      (i, e) => i == 3 && e.name.contains('Circle'): '🟢',
      (i, e) => i == 0 && e.value == '❤️': null,
    }).forEach((input, expected) {
      test('lastWhereIndexedOrNull() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).lastWhereIndexedOrNull(input)?.value;
        expect(result, expected);
      });
    });

    $({
      2: ['🟡', '❤️'],
      0: [],
      10: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('take() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).take(input).values;
        expect(result, expected);
      });
    });

    $({
      2: ['🟦', '🟢'],
      0: [],
      10: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('takeLast() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).takeLast(input).values;
        expect(result, expected);
      });
    });

    $({
      (e) => e.value == '🟡': ['🟡'],
      (e) => false: [],
      (e) => true: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('takeWhile() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).takeWhile(input).values;
        expect(result, expected);
      });
    });

    $({
      2: ['🟦', '🟢'],
      10: [],
      0: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('skip() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).skip(input).values;
        expect(result, expected);
      });
    });

    $({
      2: ['🟡', '❤️'],
      10: [],
      0: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('takeLast() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).skipLast(input).values;
        expect(result, expected);
      });
    });

    $({
      (e) => e.value == '🟡': ['❤️', '🟦', '🟢'],
      (e) => true: [],
      (e) => false: ['🟡', '❤️', '🟦', '🟢'],
    }).forEach((input, expected) {
      test('skipWhile() returns correct values', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).skipWhile(input).values;
        expect(result, expected);
      });
    });

    test('join() returns correct value', () {
      const text = '🟡text❤️text🟦text🟢';
      const expected = 'prefix🟡.❤️.🟦.🟢suffix';
      final result = EmojiParser(text).join(
        (e) => e.value,
        separator: '.',
        prefix: 'prefix',
        suffix: 'suffix',
      );
      expect(result, expected);
    });

    $({
      (e) => e.value == '🟢': true,
      (e) => e.value == '🔶': false,
    }).forEach((input, expected) {
      test('any() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).any(input);
        expect(result, expected);
      });
    });

    $({
      ['🟡', '🟢']: true,
      ['🔶', '🟢']: true,
      ['🔶']: false,
    }).forEach((input, expected) {
      test('anyOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).anyOf(input);
        expect(result, expected);
      });
    });

    $({
      (e) => e.value == '🟢': true,
      (e) => e.value == '🔶': false,
    }).forEach((input, expected) {
      test('some() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).some(input);
        expect(result, expected);
      });
    });

    $({
      ['🟡', '🟢']: true,
      ['🔶', '🟢']: true,
      ['🔶']: false,
    }).forEach((input, expected) {
      test('someOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).someOf(input);
        expect(result, expected);
      });
    });

    $({
      (e) => e.value == '🔶': true,
      (e) => e.value == '🟢': false,
    }).forEach((input, expected) {
      test('none() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).none(input);
        expect(result, expected);
      });
    });

    $({
      ['🔶']: true,
      ['🔶', '🟢']: false,
      ['🟡', '🟢']: false,
    }).forEach((input, expected) {
      test('noneOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).noneOf(input);
        expect(result, expected);
      });
    });

    $({
      (e) => e.group == Group.symbols: true,
      (e) => e.value == '🟡': false,
      (e) => e.value == '🔶': false,
    }).forEach((input, expected) {
      test('every() returns correct value', () {
        const text = '🟡text🟦text🟢';
        final result = EmojiParser(text).every(input);
        expect(result, expected);
      });
    });

    $({
      ['🟢']: true,
      ['🟡', '❤️', '🟦', '🟢']: true,
      ['🔶']: false,
    }).forEach((input, expected) {
      test('everyOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).everyOf(input);
        expect(result, expected);
      });
    });

    $({
      ['🟢']: true,
      ['🟡', '❤️', '🟦', '🟢']: true,
      ['🔶']: false,
    }).forEach((input, expected) {
      test('containsOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).containsOf(input);
        expect(result, expected);
      });
    });
    group('containsExactlyOf()', () {
      $({
        ['🟢']: false,
        ['🟡', '❤️', '🟦', '🟢']: true,
        ['🔶']: false,
      }).forEach((input, expected) {
        test('returns correct value', () {
          const text = '🟡text❤️text🟦text🟢';
          final result = EmojiParser(text).containsExactlyOf(input);
          expect(result, expected);
        });
      });
      test('returns correct value', () {
        const text = '🟡text❤️text🟦text🟢text❤️';
        final result =
            EmojiParser(text).containsExactlyOf(['🟡', '❤️', '🟦', '🟢']);
        expect(result, true);
      });
    });

    $({
      (e) => e.value == '❤️': true,
      (e) => e.value == '🔶': false,
      (Emoji e) => e.name.contains('Circle'): false,
    }).forEach((input, expected) {
      test('containsOne() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).containsOne(input);
        expect(result, expected);
      });
    });

    $({
      '🟡text': true,
      '🟡text❤️': false,
      'text': false,
    }).forEach((input, expected) {
      test('containsExactlyOne() returns correct value', () {
        final result =
            EmojiParser(input).containsExactlyOne((e) => e.value == '🟡');
        expect(result, expected);
      });
    });

    $({
      {'🟡', '❤️', '🟦', '🟢'}: true,
      {'🟡', '❤️', '🟦'}: true,
      {'🟡', '❤️', '🔶'}: false,
    }).forEach((input, expected) {
      test('containsOneOf() returns correct value', () {
        const text = '🟡text❤️text🟦text🟢';
        final result = EmojiParser(text).containsOneOf(input);
        expect(result, expected);
      });
    });

    group('containsExactlyOneOf()', () {
      $({
        {'🟡', '❤️', '🟦', '🟢'}: true,
        {'🟡', '❤️', '🟦'}: false,
        {'🟡', '❤️', '🔶'}: false,
      }).forEach((input, expected) {
        test('returns correct value', () {
          const text = '🟡text❤️text🟦text🟢';
          final result = EmojiParser(text).containsExactlyOneOf(input);
          expect(result, expected);
        });
      });
      test('returns correct value', () {
        const text = '🟡text❤️text🟦text🟢text❤️';
        final result =
            EmojiParser(text).containsExactlyOneOf({'🟡', '❤️', '🟦', '🟢'});
        expect(result, false);
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
  });
}
