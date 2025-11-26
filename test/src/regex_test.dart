import 'package:emoji_extension/src/regex.dart';
import 'package:test/test.dart';

import '../_tools/tools.dart';

void main() {
  group('Regex', () {
    test('emoji should match all available emojis up to version 17.0',
        () async {
      final text = TestEmojis.values.join();

      final extracted =
          Regex.emoji.allMatches(text).map((m) => m.group(0)).toList();

      expect(extracted, TestEmojis.values);
    });

    test('emoji should match all available emojis from emoji-test.txt v17.0',
        () async {
      final emojis = await TestEmojis.valuesAsync;
      final text = emojis.join();

      final extracted =
          Regex.emoji.allMatches(text).map((m) => m.group(0)).toList();

      expect(extracted, emojis);
    }, timeout: const Timeout(Duration(minutes: 3)));

    test('static values should match Unicode emoji-test.txt v17.0 order',
        () async {
      final unicodeEmojis = await TestEmojis.valuesAsync;

      expect(TestEmojis.values, unicodeEmojis,
          reason:
              'TestEmojis.values should contain all emojis from Unicode v17.0 in the same order');
    }, timeout: const Timeout(Duration(minutes: 3)));
  });

  $({
    'man': true,
    'Man': true,
    'MAN': true,
    'woman': false,
    'Woman': false,
    'WOMAN': false,
  }).forEach((input, expected) {
    test('man should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.man.hasMatch(input), expected);
    });
  });

  $({
    'woman': true,
    'Woman': true,
    'WOMAN': true,
    'man': false,
    'Man': false,
    'MAN': false,
  }).forEach((input, expected) {
    test('woman should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.woman.hasMatch(input), expected);
    });
  });

  $({
    'face': true,
    'Face': true,
    'FACE': true,
    'random text': false,
  }).forEach((input, expected) {
    test('face should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.face.hasMatch(input), expected);
    });
  });

  $({
    '1F3FB': true, // Light skin tone
    '1F3FC': true, // Medium-light skin tone
    '1F3FD': true, // Medium skin tone
    '1F3FE': true, // Medium-dark skin tone
    '1F3FF': true, // Dark skin tone
    '1F3FA': false, // Out of range (not a valid skin tone)
    '1F400': false, // Completely unrelated code point
    '1F3FB and 1F3FC': true, // Contains a valid match
    'No skin tone here': false, // No match
  }).forEach((input, expected) {
    test('skinTone should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.skinTone.hasMatch(input), expected);
    });
  });

  $({
    '1F9B0': true, // Blonde hair
    '1F9B1': true, // Red hair
    '1F9B2': true, // White hair
    '1F9B3': true, // Bald
    '1F471': true, // Person with blond hair
    '1F9B4': false, // Out of range (not a valid hairstyle)
    '1F470': false, // A related but different Unicode character
    '1F9B0 and 1F471': true, // Contains valid matches
    'No hairstyle emoji here': false, // No match
  }).forEach((input, expected) {
    test('hairStyle should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.hairStyle.hasMatch(input), expected);
    });
  });

  $({
    'red': true,
    'pink': true,
    'orange': true,
    'yellow': true,
    'green': true,
    'blue': true,
    'light blue': true,
    'purple': true,
    'brown': true,
    'black': true,
    'grey': true,
    'white': true,
    'Red': true,
    'Pink': true,
    'Light Blue': true,
    'text': false,
    'gold': false,
  }).forEach((input, expected) {
    test('color should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.color.hasMatch(input), expected);
    });
  });

  $({
    '1F9D4 200D 2642 FE0F': true, // Valid: Beard emoji
    '1F9D4 1F3FD 200D 2642 FE0F':
        true, // Valid: Beard emoji with skin tone modifier
    '1F9D4 1F3FB': true, // Valid: Beard emoji with light skin tone modifier
    '1F9D4 1F3FE':
        true, // Valid: Beard emoji with medium dark skin tone modifier
    'Hello 1F9D4': true, // Valid: Beard emoji in text
    '12345': false, // Invalid: Random text that doesn’t match the emoji
    '': false, // Invalid: Empty string
  }).forEach((input, expected) {
    test('beard should ${expected ? '' : 'not'} match $input', () {
      expect(Regex.beard.hasMatch(input), expected);
    });
  });
}
