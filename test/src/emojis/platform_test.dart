import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Platform', () {
    test('values count', () {
      expect(Platform.values.length, 5);
    });

    $({
      'default': Platform.Default,
      'cldr': Platform.CLDR,
      'discord': Platform.Discord,
      'github': Platform.Github,
      'slack': Platform.Slack,
    }).forEach((input, expected) {
      test('from returns returns $expected  when input is: [$input]', () {
        expect(Platform.from(input), expected);
      });
    });

    test('from throws State Error when input is invalid', () {
      const input = 'some unknown value';
      expect(() => Platform.from(input), throwsStateError);
    });
  });
}
