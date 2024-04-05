import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

import '../../_tools/test_emojis.dart';

void main() {
  test('emoji() constructs Emoji object when provided value is single emoji',
      () {
    expect(emoji('😀 '), TestEmojis.grinningFace);
  });

  test('emoji() throws assertion error  when provided value is multiple emojis',
      () {
    expect(() => emoji('😀😀'), throwsA(isA<AssertionError>()));
  });

  test('emoji() throws assertion error  when provided value is not an emoji',
      () {
    expect(() => emoji('not an emoji'), throwsA(isA<AssertionError>()));
  });
}
