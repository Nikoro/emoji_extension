import 'package:emoji_extension/src/emojis/version.dart';
import 'package:test/test.dart';

void main() {
  group('Version', () {
    test('values count', () {
      expect(Version.values.length, 13);
    });
  });
}
