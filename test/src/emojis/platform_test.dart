import 'package:emoji_extension/src/emojis/platform.dart';
import 'package:test/test.dart';

void main() {
  group('Platform', () {
    test('values count', () {
      expect(Platform.values.length, 5);
    });
  });
}
