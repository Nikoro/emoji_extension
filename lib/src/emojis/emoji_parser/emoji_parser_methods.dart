part of 'emoji_parser.dart';

extension EmojiParserMethods on EmojiParser {
  void forEach(void Function(Emoji emoji) action) => get.forEach(action);

  void forEachWhile(bool Function(Emoji emoji) action) {
    get.forEachWhile(action);
  }

  void forEachIndexed(void Function(int index, Emoji emoji) action) {
    get.forEachIndexed(action);
  }

  void forEachIndexedWhile(bool Function(int index, Emoji emoji) action) {
    get.forEachIndexedWhile(action);
  }

  List<Emoji> map(Emoji Function(Emoji emoji) toElement) {
    return get.map(toElement).toUnmodifiableList();
  }

  List<Emoji> mapIndexed(Emoji Function(int index, Emoji emoji) convert) {
    return get.mapIndexed(convert).toUnmodifiableList();
  }

  List<Emoji> where(bool Function(Emoji emoji) test) {
    return get.where(test).toUnmodifiableList();
  }

  List<Emoji> whereIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereIndexed(test).toUnmodifiableList();
  }

  List<Emoji> whereNot(bool Function(Emoji emoji) test) {
    return get.whereNot(test).toUnmodifiableList();
  }

  List<Emoji> whereNotIndexed(bool Function(int index, Emoji emoji) test) {
    return get.whereNotIndexed(test).toUnmodifiableList();
  }

  T fold<T>(T initialValue, T Function(T previousValue, Emoji emoji) combine) {
    return get.fold(initialValue, combine);
  }

  T foldIndexed<T>(
    T initialValue,
    T Function(int index, T previousValue, Emoji emoji) combine,
  ) {
    return get.foldIndexed(initialValue, combine);
  }

  Emoji firstWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhere(test, orElse: orElse);
  }

  Emoji firstWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.firstWhereIndexed(test, orElse: orElse);
  }

  Emoji? firstWhereOrNull(bool Function(Emoji emoji) test) {
    return get.firstWhereOrNull(test);
  }

  Emoji? firstWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.firstWhereIndexedOrNull(test);
  }

  Emoji lastWhere(
    bool Function(Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhere(test, orElse: orElse);
  }

  Emoji lastWhereIndexed(
    bool Function(int index, Emoji emoji) test, {
    Emoji Function()? orElse,
  }) {
    return get.lastWhereIndexed(test, orElse: orElse);
  }

  Emoji? lastWhereOrNull(bool Function(Emoji emoji) test) {
    return get.lastWhereOrNull(test);
  }

  Emoji? lastWhereIndexedOrNull(bool Function(int index, Emoji emoji) test) {
    return get.lastWhereIndexedOrNull(test);
  }

  List<Emoji> take(int count) => get.take(count).toUnmodifiableList();

  List<Emoji> takeLast(int count) => get.takeLast(count).toUnmodifiableList();

  List<Emoji> takeWhile(bool Function(Emoji emoji) test) {
    return get.takeWhile(test).toUnmodifiableList();
  }

  List<Emoji> skip(int count) => get.skip(count).toUnmodifiableList();

  List<Emoji> skipWhile(bool Function(Emoji emoji) test) {
    return get.skipWhile(test).toUnmodifiableList();
  }

  List<Emoji> skipLast(int count) => get.skipLast(count).toUnmodifiableList();

  String join(
    String Function(Emoji emoji) transform, {
    String separator = '',
    String prefix = '',
    String suffix = '',
  }) {
    final buffer = StringBuffer();
    int count = 0;

    buffer.write(prefix);
    for (final emoji in get) {
      if (++count > 1) buffer.write(separator);
      buffer.write(transform(emoji));
    }

    buffer.write(suffix);
    return buffer.toString();
  }

  bool any(bool Function(Emoji emoji) test) => get.any(test);

  bool some(bool Function(Emoji emoji) test) => get.any(test);

  bool someOf(List<String> emojis) => emojis.none(_value.contains);

  bool none(bool Function(Emoji emoji) test) => get.none(test);

  bool noneOf(List<String> emojis) => emojis.none(_value.contains);

  bool every(bool Function(Emoji emoji) test) => get.every(test);

  bool containsOnly(bool Function(Emoji emoji) test) {
    return where(test).isNotEmpty && whereNot(test).isEmpty;
  }

  bool containsOnlyOf(List<String> emojis) {
    return emojis.every((e) => extract.contains(e)) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }

  bool containsOnlyOne(bool Function(Emoji emoji) test) {
    return where(test).length == 1 && whereNot(test).isEmpty;
  }

  bool containsOnlyOneOf(Set<String> emojis) {
    return emojis
            .every((e) => extract.where((value) => value == e).length == 1) &&
        whereNot((e) => emojis.contains(e.value)).isEmpty;
  }
}
