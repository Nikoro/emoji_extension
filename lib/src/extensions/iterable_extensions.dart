/// Provides extensions for [Iterable] classes.
extension IterableExtensions<E> on Iterable<E> {
  /// Returns an unmodifiable [List] containing all elements from this iterable.
  ///
  /// The returned list is unmodifiable, meaning that attempts to modify it
  /// (add, remove or change elements) will throw an [UnsupportedError].
  List<E> toUnmodifiableList() => List.unmodifiable(this);
}
