import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('HairStyleListExtensions', () {
    test('values returns correct value', () {
      final values = [HairStyle.blondHair, HairStyle.redHair].values;
      expect(values, [HairStyle.blondHair.value, HairStyle.redHair.value]);
    });
  });
}
