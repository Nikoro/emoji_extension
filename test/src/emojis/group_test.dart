import 'package:emoji_extension/src/emojis/group.dart';
import 'package:test/test.dart';

import '../../_tools/tools.dart';

void main() {
  group('Group', () {
    test('values count', () {
      expect(Group.values.length, 10);
    });

    $({
      Group.smileysAndEmotion: 16,
      Group.peopleAndBody: 16,
      Group.component: 2,
      Group.animalsAndNature: 8,
      Group.foodAndDrink: 8,
      Group.travelAndPlaces: 11,
      Group.activities: 5,
      Group.objects: 18,
      Group.symbols: 14,
      Group.flags: 3,
    }).forEach((input, expected) {
      test('subgroups values count', () {
        expect(input.subgroups.length, expected);
      });
    });

    $({
      'People & Body': Group.peopleAndBody,
      'Component': Group.component,
      'Animals & Nature': Group.animalsAndNature,
      'Food & Drink': Group.foodAndDrink,
      'Travel & Places': Group.travelAndPlaces,
      'Activities': Group.activities,
      'Objects': Group.objects,
      'Symbols': Group.symbols,
      'Flags': Group.flags,
    }).forEach((input, expected) {
      test('from returns returns $expected  when input is: [$input]', () {
        expect(Group.from(input), expected);
      });
    });

    test('from throws State Error when input is invalid', () {
      const input = 'some unknown value';
      expect(() => Group.from(input), throwsStateError);
    });
  });
}
