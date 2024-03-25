import 'package:emoji_extension/src/emojis/status.dart';
import 'package:test/test.dart';

void main() {
  group('Status', () {
    test('values count', () {
      expect(Status.values.length, 4);
    });
  });
}
