import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('SkinToneIterableExtensions', () {
    test('values returns correct value', () {
      final values = [SkinTone.light, SkinTone.dark].values;
      expect(values, [SkinTone.light.value, SkinTone.dark.value]);
    });
  });
}
