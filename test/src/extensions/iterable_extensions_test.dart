import 'package:emoji_extension/src/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('IterableExtensions', () {
    test('toUnmodifiableList() returns unmodifiable List', () {
      final list = [].toUnmodifiableList();
      expect(() => list.add(3), throwsUnsupportedError);
      expect(() => list[0] = 1, throwsUnsupportedError);
      expect(() => list.clear(), throwsUnsupportedError);
    });
  });
}
