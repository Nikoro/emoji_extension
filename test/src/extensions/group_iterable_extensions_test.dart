import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('GroupIterableExtensions', () {
    test('values returns correct value', () {
      final values = [Group.smileysAndEmotion, Group.peopleAndBody].values;
      expect(
          values, [Group.smileysAndEmotion.value, Group.peopleAndBody.value]);
    });
  });
}
