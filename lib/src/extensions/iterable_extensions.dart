/// Provides extensions for [Iterable] classes.
extension IterableExtensions<E> on Iterable<E> {
  /// Returns an unmodifiable [List] containing all elements from this iterable.
  ///
  /// The returned list is unmodifiable, meaning that attempts to modify it
  /// (add, remove or change elements) will throw an [UnsupportedError].
  List<E> toUnmodifiableList() => List.unmodifiable(this);

  /// Returns a list containing only the distinct elements from this iterable.
  ///
  /// The returned list maintains the order of the original elements.
  List<E> distinct() => toSet().toUnmodifiableList();

  /// Maps each element of this iterable to a non-null result
  /// using the provided [transform] function and returns a new iterable
  /// containing only the non-null results.
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

  E firstWhereIndexed(
    bool Function(int index, E element) test, {
    E Function()? orElse,
  }) {
    int index = 0;
    for (E element in this) {
      if (test(index++, element)) return element;
    }

    if (orElse != null) return orElse();
    throw StateError("No element");
  }

  E lastWhereIndexed(
    bool Function(int index, E element) test, {
    E Function()? orElse,
  }) {
    E? result;
    int index = 0;
    for (E element in this) {
      if (test(index++, element)) result = element;
    }
    if (result != null) return result;
    if (orElse != null) return orElse();
    throw StateError("No element");
  }

  Iterable<E> takeLast(int count) => skip(length - count);

  Iterable<E> skipLast(int count) => take(length - count);

  /// Returns the second element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than two elements.
  E get second => elementAt(1);

  E? get secondOrNull => elementAtOrNull(1);

  /// Returns the third element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than three elements.
  E get third => elementAt(2);

  E? get thirdOrNull => elementAtOrNull(2);

  /// Returns the fourth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than four elements.
  E get fourth => elementAt(3);

  E? get fourthOrNull => elementAtOrNull(3);

  /// Returns the fifth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than five elements.
  E get fifth => elementAt(4);

  E? get fifthOrNull => elementAtOrNull(4);

  /// Returns the sixth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than six elements.
  E get sixth => elementAt(5);

  E? get sixthOrNull => elementAtOrNull(5);

  /// Returns the penultimate (second to last) element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than two elements.
  E get penultimate => elementAt(length - 2);

  E? get penultimateOrNull => elementAtOrNull(length - 2);

  List<E> get shuffled {
    final list = [...this]..shuffle();
    return list.toUnmodifiableList();
  }
}
