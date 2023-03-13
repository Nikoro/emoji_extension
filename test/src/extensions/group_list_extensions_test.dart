import 'package:emoji_extension/src/emojis/group.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('GroupListExtensions', () {
    test('values returns correct value', () {
      final values = [Group.smileysAndEmotion, Group.peopleAndBody].values;
      expect(
          values, [Group.smileysAndEmotion.value, Group.peopleAndBody.value]);
    });
  });
}
