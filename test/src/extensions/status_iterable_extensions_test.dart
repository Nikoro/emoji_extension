import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('StatusIterableExtensions', () {
    test('values returns correct value', () {
      final values = [Status.fullyQualified, Status.unqualified].values;
      expect(values, [Status.fullyQualified.value, Status.unqualified.value]);
    });
  });
}
