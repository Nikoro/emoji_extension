import 'package:emoji_extension/src/emojis/status.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Status', () {
    test('values count', () {
      expect(Status.values.length, 4);
    });

    $({
      'fully-qualified': Status.fullyQualified,
      'minimally-qualified': Status.minimallyQualified,
      'unqualified': Status.unqualified,
      'component': Status.component,
    }).forEach((input, expected) {
      test('from returns returns $expected  when input is: [$input]', () {
        expect(Status.from(input), expected);
      });
    });

    test('from throws State Error when input is invalid', () {
      const input = 'some unknown value';
      expect(() => Status.from(input), throwsStateError);
    });
  });
}
