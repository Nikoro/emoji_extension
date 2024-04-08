import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../../_tools/tools.dart';

void main() {
  group('EmojiMethods', () {
    test('toUnicodeEscapeSequence() returns correct value', () {
      expect(
          TestEmojis.grinningFace.toUnicodeEscapeSequence(), '\\uD83D\\uDE00');
    });
  });
}
