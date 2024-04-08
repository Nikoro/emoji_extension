import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('SubgroupIterableExtensions', () {
    test('values returns correct value', () {
      final values = [Subgroup.faceSmiling, Subgroup.faceAffection].values;
      expect(
        values,
        [Subgroup.faceSmiling.value, Subgroup.faceAffection.value],
      );
    });
  });
}
