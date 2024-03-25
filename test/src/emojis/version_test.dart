import 'package:emoji_extension/src/emojis/version.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Version', () {
    test('values count', () {
      expect(Version.values.length, 13);
    });

    $({
      6.0: Version.v6_0,
      7.0: Version.v7_0,
      8.0: Version.v8_0,
      9.0: Version.v9_0,
      10.0: Version.v10_0,
      11.0: Version.v11_0,
      12.0: Version.v12_0,
      12.1: Version.v12_1,
      13.0: Version.v13_0,
      13.1: Version.v13_1,
      14.0: Version.v14_0,
      15.0: Version.v15_0,
      15.1: Version.v15_1,
    }).forEach((input, expected) {
      test('from returns returns $expected  when input is: [$input]', () {
        expect(Version.from(input), expected);
      });
    });

    test('from throws State Error when input is invalid', () {
      expect(() => Version.from(0), throwsStateError);
    });
  });
}
