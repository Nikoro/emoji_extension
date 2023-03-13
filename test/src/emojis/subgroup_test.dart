import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:test/test.dart';

void main() {
  group('Subgroup', () {
    test('values count', () {
      expect(Subgroup.values.length, 101);
    });
  });
}
