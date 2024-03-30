import 'package:emoji_extension/emoji_extension.dart';
import 'package:emoji_extension/src/emojis/emoji_parser/emoji_parser.dart';
import 'package:test/test.dart';

void main() {
  group('EmojiExtension', () {
    test('emojis returns EmojiParser', () async {
      final value = ''.emojis;
      expect(value, isA<EmojiParser>());
    });
  });
}
