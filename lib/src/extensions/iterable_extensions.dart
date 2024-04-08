import 'package:collection/collection.dart';

/// Provides extensions for [Iterable] classes.
extension IterableExtensions<E> on Iterable<E> {
  /// Returns an unmodifiable [List] containing all elements from this iterable.
  ///
  /// The returned list is unmodifiable, meaning that attempts to modify it
  /// (add, remove or change elements) will throw an [UnsupportedError].
  List<E> toUnmodifiableList() => List.unmodifiable(this);

  /// Returns a new unmodifiable list containing only the distinct elements from the original list.
  ///
  /// The returned unmodifiable list maintains the order of the original elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 2, 3, 4, 4, 5].distinct(); // [1, 2, 3, 4, 5]
  /// ```
  List<E> distinct() => toSet().toUnmodifiableList();

  /// Returns a new iterable where each element is the result of applying the [transform] function
  /// to the corresponding element of this iterable, and then excluding any null results.
  ///
  /// The resulting iterable may have fewer elements than this iterable if any elements
  /// produce null when transformed.
  ///
  /// Example:
  /// ```dart
  /// [1, null, 3, null, 5].mapNotNull((e) => e); // (1, 3, 5)
  /// ```
  Iterable<R> mapNotNull<R extends Object>(R? Function(E? e) transform) {
    final resultList = <R>[];
    for (final element in this) {
      final item = transform(element);
      if (item != null) {
        resultList.add(item);
      }
    }

    return resultList;
  }

  /// Returns the first element in the iterable that satisfies the provided test function,
  /// along with its index.
  ///
  /// The [test] function takes two arguments: the index of the element and the element itself.
  /// It should return `true` if the element meets the condition, otherwise `false`.
  ///
  /// Optionally, you can provide the [orElse] function, which will be executed if no element
  /// satisfies the test condition. If [orElse] is not provided and no element is found,
  /// a [StateError] will be thrown.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].firstWhereIndexed((index, value) => value > 2); // 3
  /// ```
  E firstWhereIndexed(
    bool Function(int index, E element) test, {
    E Function()? orElse,
  }) {
    int index = 0;
    for (final element in this) {
      if (test(index++, element)) return element;
    }

    if (orElse != null) return orElse();
    throw StateError("No element");
  }

  /// Returns the last element that satisfies the given [test] function along with its index in the iterable.
  ///
  /// If no element satisfies the condition, and [orElse] is not provided, it throws a [StateError].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].lastWhereIndexed((index, element) => element % 2 == 0); // 4
  /// ```
  E lastWhereIndexed(
    bool Function(int index, E element) test, {
    E Function()? orElse,
  }) {
    E? result;
    int index = 0;
    for (final element in this) {
      if (test(index++, element)) result = element;
    }
    if (result != null) return result;
    if (orElse != null) return orElse();
    throw StateError("No element");
  }

  /// Returns an iterable that yields the last [count] elements of this iterable.
  /// If [count] is greater than or equal to the length of this iterable, it returns
  /// the original iterable.
  ///
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].takeLast(3); // (3, 4, 5)
  /// [1, 2, 3, 4, 5].takeLast(10); // (1, 2, 3, 4, 5)
  /// [1, 2, 3, 4, 5].takeLast(0); // ()
  /// ```
  Iterable<E> takeLast(int count) {
    return count >= length ? this : skip(length - count);
  }

  /// Returns an iterable that skips the last [count] elements of this iterable.
  ///
  /// If [count] is greater than or equal to the length of the iterable, an empty iterable is returned.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].skipLast(2); // (1, 2, 3)
  /// [1, 2, 3, 4, 5].skipLast(10); // ()
  /// [1, 2, 3, 4, 5].skipLast(0); // (1, 2, 3, 4, 5)
  /// ```
  Iterable<E> skipLast(int count) {
    return count >= length ? const Iterable.empty() : take(length - count);
  }

  /// Returns the second element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than two elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].second; // 2
  /// ```
  E get second => elementAt(1);

  /// Returns the second element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].secondOrNull; // 2
  /// [].secondOrNull; // null
  /// ```
  E? get secondOrNull => elementAtOrNull(1);

  /// Returns the third element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than three elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].third; // 3
  /// ```
  E get third => elementAt(2);

  /// Returns the third element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].thirdOrNull; // 3
  /// [].thirdOrNull; // null
  /// ```
  E? get thirdOrNull => elementAtOrNull(2);

  /// Returns the fourth element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than four elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].fourth; // 4
  /// ```
  E get fourth => elementAt(3);

  /// Returns the fourth element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].fourthOrNull; // 4
  /// [].fourthOrNull; // null
  /// ```
  E? get fourthOrNull => elementAtOrNull(3);

  /// Returns the fifth element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than five elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].fifth; // 5
  /// ```
  E get fifth => elementAt(4);

  /// Returns the fifth element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].fifthOrNull; // 5
  /// [].fifthOrNull; // null
  /// ```
  E? get fifthOrNull => elementAtOrNull(4);

  /// Returns the sixth element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than six elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].sixth; // 6
  /// ```
  E get sixth => elementAt(5);

  /// Returns the sixth element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].sixthOrNull; // 6
  /// [].sixthOrNull; // null
  /// ```
  E? get sixthOrNull => elementAtOrNull(5);

  /// Returns the penultimate (second to last) element from this iterable.
  ///
  /// Throws a [RangeError] if the iterable has fewer than two elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].penultimate; // 5
  /// ```
  E get penultimate => elementAt(length - 2);

  /// Returns the the penultimate (second to last) element in the iterable if it exists, otherwise returns `null`.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5, 6].penultimateOrNull; // 5
  /// [].penultimateOrNull; // null
  /// ```
  E? get penultimateOrNull => length < 2 ? null : elementAtOrNull(length - 2);

  /// Returns a new unmodifiable list containing the elements of this list in a random order.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].shuffled; // e.g. [4, 2, 5, 1, 3]
  /// ```
  List<E> get shuffled => ([...this]..shuffle()).toUnmodifiableList();
}
