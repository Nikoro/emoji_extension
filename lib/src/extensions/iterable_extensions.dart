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

  /// Returns the second element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than two elements.
  E get second => elementAt(1);

  /// Returns the third element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than three elements.
  E get third => elementAt(2);

  /// Returns the fourth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than four elements.
  E get fourth => elementAt(3);

  /// Returns the fifth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than five elements.
  E get fifth => elementAt(4);

  /// Returns the sixth element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than six elements.
  E get sixth => elementAt(5);

  /// Returns the penultimate (second to last) element from this iterable.
  ///
  /// Throws an [IndexError] if this iterable has fewer than two elements.
  E get penultimate => elementAt(length - 2);
}
