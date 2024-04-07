import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('ColorListExtensions', () {
    test('values returns correct value', () {
      final values = [Color.red, Color.lightBlue].values;
      expect(values, [Color.red.value, Color.lightBlue.value]);
    });
  });
}
