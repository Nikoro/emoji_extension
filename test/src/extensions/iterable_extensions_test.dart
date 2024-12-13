import 'package:collection/collection.dart' hide IterableExtension;
import 'package:emoji_extension/emoji_extension.dart';
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

    group('secondOrNull', () {
      test('returns the second element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.secondOrNull, 2);
      });

      test('returns null if the list has less than 2 elements', () {
        final list = [1];
        expect(list.secondOrNull, null);
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

    group('thirdOrNull', () {
      test('returns the third element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.thirdOrNull, 3);
      });

      test('returns null if the list has less than 3 elements', () {
        final list = [1, 2];
        expect(list.thirdOrNull, null);
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

    group('fourthOrNull', () {
      test('returns the fourth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.fourthOrNull, 4);
      });

      test('returns null if the list has less than 4 elements', () {
        final list = [1, 2, 3];
        expect(list.fourthOrNull, null);
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

    group('fifthOrNull', () {
      test('returns the fifth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.fifthOrNull, 5);
      });

      test('returns null if the list has less than 5 elements', () {
        final list = [1, 2, 3, 4];
        expect(list.fifthOrNull, null);
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

    group('sixthOrNull', () {
      test('returns the sixth element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.sixthOrNull, 6);
      });

      test('returns null if the list has less than 6 elements', () {
        final list = [1, 2, 3, 4, 5];
        expect(list.sixthOrNull, null);
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

    group('penultimateOrNull', () {
      test('returns the the second-to-last element of the list', () {
        final list = [1, 2, 3, 4, 5, 6];
        expect(list.penultimateOrNull, 5);
      });

      test('returns null if the list has less than 2 elements', () {
        final list = [1];
        expect(list.penultimateOrNull, null);
      });
    });

    group('firstWhereIndexed', () {
      final list = [1, 2, 3, 4, 5];
      test('with valid element', () {
        final result = list.firstWhereIndexed((i, e) => i == 2);
        expect(result, 3);
      });

      test('with invalid element and orElse', () {
        final result = list.firstWhereIndexed(
          (i, e) => i == 6,
          orElse: () => 0,
        );
        expect(result, equals(0));
      });

      test('with invalid element and no orElse', () {
        expect(
          () => list.firstWhereIndexed((i, e) => i == 6),
          throwsA(isStateError),
        );
      });
    });

    group('lastWhereIndexed', () {
      final list = [1, 2, 3, 4, 5];
      test('with valid element', () {
        final result = list.lastWhereIndexed((i, e) => i == 2);
        expect(result, 3);
      });

      test('with invalid element and orElse', () {
        final result = list.lastWhereIndexed(
          (i, e) => i == 6,
          orElse: () => 0,
        );
        expect(result, equals(0));
      });

      test('with invalid element and no orElse', () {
        expect(
          () => list.lastWhereIndexed((i, e) => i == 6),
          throwsA(isStateError),
        );
      });
    });

    group('takeLast', () {
      final list = [1, 2, 3, 4, 5];
      test('with valid count', () {
        final result = list.takeLast(2);
        expect(result, equals([4, 5]));
      });

      test('with count exceeding length', () {
        final result = list.takeLast(10);
        expect(result, equals([1, 2, 3, 4, 5]));
      });

      test('with count of 0', () {
        final result = list.takeLast(0);
        expect(result, isEmpty);
      });
    });

    group('skipLast', () {
      final list = [1, 2, 3, 4, 5];
      test('with valid count', () {
        final result = list.skipLast(2);
        expect(result, equals([1, 2, 3]));
      });

      test('with count exceeding length', () {
        final result = list.skipLast(10);
        expect(result, isEmpty);
      });

      test('with count of 0', () {
        final result = list.skipLast(0);
        expect(result, equals([1, 2, 3, 4, 5]));
      });
    });

    group('shuffled', () {
      test('returns a shuffled version of the list', () {
        final list = [1, 2, 3, 4, 5];
        final shuffledList = list.shuffled;

        expect(
            const DeepCollectionEquality.unordered().equals(shuffledList, list),
            true);
      });
    });
  });
}
