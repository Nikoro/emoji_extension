import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('HairStyleIterableExtensions', () {
    test('values returns correct value', () {
      final values = [HairStyle.blond, HairStyle.red].values;
      expect(values, [HairStyle.blond.value, HairStyle.red.value]);
    });
  });
}
