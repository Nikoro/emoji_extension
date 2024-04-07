import 'package:emoji_extension/emoji_extension.dart';
import 'package:test/test.dart';

void main() {
  group('VersionListExtensions', () {
    test('values returns correct value', () {
      final values = [Version.v8_0, Version.v6_0].values;
      expect(values, [Version.v8_0.value, Version.v6_0.value]);
    });
  });
}
