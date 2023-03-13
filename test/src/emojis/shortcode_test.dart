import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:test/test.dart';

void main() {
  final shortcode1 = Shortcode(platform: 'cldr', values: ['grinning_face']);
  final shortcode2 = Shortcode(platform: 'cldr', values: ['grinning_face']);
  const shortcode3 = Shortcode.cldr(['grinning_face']);

  group('Shortcode', () {
    test('equality', () {
      expect(shortcode1 == shortcode2, true);
      expect(shortcode2 == shortcode3, true);
    });

    test('hashCode', () {
      expect(shortcode1.hashCode == shortcode2.hashCode, true);
      expect(shortcode2.hashCode == shortcode3.hashCode, true);
    });

    test('toString()', () {
      final result = shortcode1.toString();
      const expected = '\n    Shortcode(\n'
          '    platform: CLDR,\n'
          '    values: [grinning_face]\n'
          '  )';
      expect(result, expected);
    });
  });
}
