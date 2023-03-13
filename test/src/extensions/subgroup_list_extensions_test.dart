import 'package:emoji_extension/src/emojis/subgroup.dart';
import 'package:emoji_extension/src/extensions/extensions.dart';
import 'package:test/test.dart';

void main() {
  group('SubgroupListExtensions', () {
    test('values returns correct value', () {
      final values = [Subgroup.faceSmiling, Subgroup.faceAffection].values;
      expect(
        values,
        [Subgroup.faceSmiling.value, Subgroup.faceAffection.value],
      );
    });
  });
}
