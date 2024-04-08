import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

void main() {
  final emoji1 = TestEmojis.grinningFace;
  final emoji2 = Emoji('😀');
  final emoji3 = Emojis.getOne('1F600');

  group('Emoji', () {
    group('Constructor Emoji()', () {
      test('constructs Emoji object when provided value is single emoji', () {
        expect(Emoji('😀'), TestEmojis.grinningFace);
      });

      test('throws assertion error  when provided value is multiple emojis',
          () {
        expect(() => Emoji('😀😀'), throwsA(isA<AssertionError>()));
      });

      test('throws assertion error  when provided value is not an emoji', () {
        expect(() => Emoji('not an emoji'), throwsA(isA<AssertionError>()));
      });
    });
    test('equality', () {
      expect(emoji1 == emoji2, true);
      expect(emoji2 == emoji3, true);
    });

    test('hashCode', () {
      expect(emoji1.hashCode == emoji2.hashCode, true);
      expect(emoji2.hashCode == emoji3.hashCode, true);
    });

    test('toString()', () {
      final result = emoji1.toString();
      const expected = 'Emoji(\n'
          '  value: 😀,\n'
          '  unicode: 1F600,\n'
          '  name: Grinning Face,\n'
          '  appleName: Grinning Face,\n'
          '  alsoKnownAs: [Happy Face, Smiley Face],\n'
          '  group: Smileys & Emotion,\n'
          '  subgroup: face-smiling,\n'
          '  version: 8.0,\n'
          '  status: fully-qualified,\n'
          '  shortcodes: [\n'
          '    Shortcode(\n'
          '    platform: Default,\n'
          '    values: [grinning_face]\n'
          '  ), \n'
          '    Shortcode(\n'
          '    platform: CLDR,\n'
          '    values: [grinning_face]\n'
          '  ), \n'
          '    Shortcode(\n'
          '    platform: Discord,\n'
          '    values: [grinning]\n'
          '  ), \n'
          '    Shortcode(\n'
          '    platform: Github,\n'
          '    values: [grinning]\n'
          '  ), \n'
          '    Shortcode(\n'
          '    platform: Slack,\n'
          '    values: [grinning]\n'
          '  )]\n'
          ')';
      expect(result, expected);
    });
  });
}
