import 'package:emoji_extension/src/extensions/extensions.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('IterableExtensions', () {
    test('toUnmodifiableList() returns unmodifiable List', () {
      final list = [].toUnmodifiableList();
      expect(() => list.add(3), throwsUnsupportedError);
      expect(() => list[0] = 1, throwsUnsupportedError);
      expect(() => list.clear(), throwsUnsupportedError);
    });

    test('distinct() returns a list with distinct elements', () {
      final list = [1, 2, 2, 3, 3, 4, 5, 5, 5];
      expect(list.distinct(), [1, 2, 3, 4, 5]);
    });

    $({
      [1, 2, null, 3, null, 4]: [1, 2, 3, 4],
      [1, 2, 3]: [1, 2, 3]
    }).forEach((input, expected) {
      test('mapNotNull returns $expected when input is: $input', () {
        expect(input.mapNotNull((e) => e), expected);
      });
    });

    group('second', () {
      test('returns the second element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.second, 2);
      });

      test('throws RangeError if the list has less than 2 elements', () {
        final list = [1];
        expect(() => list.second, throwsRangeError);
      });
    });

    group('third', () {
      test('returns the third element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.third, 3);
      });

      test('throws RangeError if the list has less than 3 elements', () {
        final list = [1, 2];
        expect(() => list.third, throwsRangeError);
      });
    });

    group('fourth', () {
      test('returns the fourth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.fourth, 4);
      });

      test('throws RangeError if the list has less than 4 elements', () {
        final list = [1, 2, 3];
        expect(() => list.fourth, throwsRangeError);
      });
    });

    group('fifth', () {
      test('returns the fifth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.fifth, 5);
      });

      test('throws RangeError if the list has less than 5 elements', () {
        final list = [1, 2, 3, 4];
        expect(() => list.fifth, throwsRangeError);
      });
    });

    group('sixth', () {
      test('returns the sixth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.sixth, 6);
      });

      test('throws RangeError if the list has less than 6 elements', () {
        final list = [1, 2, 3, 4, 5];
        expect(() => list.sixth, throwsRangeError);
      });
    });

    group('penultimate', () {
      test('returns the the second-to-last element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.penultimate, 5);
      });

      test('throws RangeError if the list has less than 2 elements', () {
        final list = [1];
        expect(() => list.penultimate, throwsRangeError);
      });
    });
  });
}
