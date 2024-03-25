import 'package:emoji_extension/src/emojis/status.dart';
import 'package:emoji_extension/src/extensions/status_list_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('StatusListExtensions', () {
    test('values returns correct value', () {
      final values = [Status.fullyQualified, Status.unqualified].values;
      expect(values, [Status.fullyQualified.value, Status.unqualified.value]);
    });
  });
}
