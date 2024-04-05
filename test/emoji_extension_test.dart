import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('EmojiExtension', () {
    test('emojis returns EmojiParser', () async {
      final value = ''.emojis;
      expect(value, isA<EmojiParser>());
    });
  });
}
