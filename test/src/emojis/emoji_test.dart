import 'package:emoji_extension/src/emojis/emoji.dart';
import 'package:emoji_extension/src/emojis/group.dart';
import 'package:emoji_extension/src/emojis/shortcode.dart';
import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:test/test.dart';

import '../../_tools/test_emojis.dart';

void main() {
  const emoji1 = TestEmojis.grinningFace;
  const emoji2 = TestEmojis.grinningFace;
  const emoji3 = Emoji(
    value: '😀',
    name: 'Grinning Face',
    unicode: '1F600',
    group: Group.smileysAndEmotion,
    subgroup: Subgroup.faceSmiling,
    shortcodes: [
      Shortcode.$default(['grinning_face']),
      Shortcode.cldr(['grinning_face']),
      Shortcode.discord(['grinning']),
      Shortcode.github(['grinning']),
      Shortcode.slack(['grinning']),
    ],
  );

  group('Emoji', () {
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
          '  group: Smileys & Emotion,\n'
          '  subgroup: face-smiling,\n'
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

    test('shortcode returns CLDR shortcode with colons around', () {
      expect(emoji1.shortcode, ':grinning_face:');
    });

    test('toUnicodeEscapeSequence() returns correct value', () {
      expect(emoji1.toUnicodeEscapeSequence(), '\\uD83D\\uDE00');
    });
  });
}
