import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:test/test.dart';

void main() {
  const shortcode1 = Shortcode.cldr(['grinning_face']);
  final shortcode2 = shortcode1.copyWith();
  final shortcode3 = shortcode1.copyWith(platform: Platform.CLDR);

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
